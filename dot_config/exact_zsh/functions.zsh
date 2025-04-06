function colormap() {
  for i in {0..255}; do 
    print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f "
  done
  print ""
}

# colormap function - Displays 256 terminal colors in a grid
function colormap() {
  for i in {0..255}; do
    print -Pn "%K{$i}  %k%F{$i}$(printf '%3d' $i)%f  "
    if (( (i + 1) % 8 == 0 )); then
      print ""  # New line after every 8 colors
    fi
  done
}
