
# --- Automation  ---
# -- Terraform --
alias tf="terraform"
alias tfi="tf init"
alias tfv="tf validate"
alias tfp="tf plan"
alias tfa="tf apply"
alias tfd="tf destroy"
alias tff="tf fmt"

alias a="ansible"
alias ap="ansible-playbook"
alias p="packer"

# --- ls replacement eza  ---
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l"
alias la="eza --icons --group-directories-first -la"
alias lt="eza --icons --group-directories-first --tree --level=1 . --ignore-glob=.git"
alias ltt="eza --icons --group-directories-first --tree --level=3 . --ignore-glob=.git"
alias l.="eza --icons --group-directories-first -d .*"

# --- Admin functions  ---
alias ss="sudo"
alias reload="source ~/.zshrc"
alias update="apt update && apt upgrade -y"
alias cat="bat --theme=ansi"
alias te="micro"
alias cl="clear"
alias lzd="lazydocker"
alias lzg="lazygit"
alias nv="nvim"

# --- Directory traversal  ---
alias cd="z"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."


