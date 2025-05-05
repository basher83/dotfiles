ts_ssh() {
  local cache_file="/tmp/ts_status_cache.json"
  local debug=1 # ← Set to 1 to print debug info

  # Refresh cache if needed
  if [ ! -f "$cache_file" ] || [ "$(find "$cache_file" -mmin +1 2>/dev/null)" ]; then
    tailscale status --json >"$cache_file"
  fi

  # Use fzf to pick host
  local selected=$(jq -r '
    .Peer | to_entries[] |
    .value.HostName as $host |
    (.value.Tags // []) as $tags |
    [$host, ($tags | join(","))] | @tsv
  ' "$cache_file" | column -t | fzf --prompt="Pick a Tailscale host: ")

  [ -z "$selected" ] && echo "❌ Cancelled" && return 1

  local host=$(echo "$selected" | awk '{print $1}')

  # Get space-separated tags
  local tag_string=$(jq -r --arg host "$host" '
    .Peer | to_entries[]
    | select(.value.HostName == $host)
    | (.value.Tags // []) | join(" ")
  ' "$cache_file")

  [ "$debug" -eq 1 ] && echo "🐛 Host selected: $host"
  [ "$debug" -eq 1 ] && echo "🐛 Tags: $tag_string"

  # Default user
  local user="root"

  local tags_array
  IFS=' ' read -rA tags_array <<<"$tag_string"
  for tag in $tags_array; do
    case "$tag" in
    tag:homelab-og) user="root" ;;
    tag:homelab-doggos) user="ansible" ;;
    tag:nomad-client) user="ansible" ;;
    tag:nomad-server) user="ansible" ;;
    tag:proxmox) user="root" ;;
    tag:cloud) user="root" ;;
    tag:reverse-proxy) user="root" ;;
    esac
    [ "$debug" -eq 1 ] && echo "🐛 Matching tag: $tag → user: $user"
  done

  echo "🔐 Connecting to $host as $user"
  tailscale ssh "$user@$host"
}
