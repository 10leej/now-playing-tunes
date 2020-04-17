dbus-monitor --session "path=/org/mpris/MediaPlayer2" --monitor | awk '
  /string  *"xesam:artist/{
    while (1) {
      getline line
      if (line ~ /string "/){
        sub(/.*string "/, "artist:", line)
        sub(/".*$/, "", line)
        print line > "/home/joshua/song-artist.txt"
        close("/home/joshua/song-artist.txt")
        break
      }
    }
  }
  /string  *"xesam:title/{
    while (1) {
      getline line
      if (line ~ /string "/){
        sub(/.*string "/, "title:", line)
        sub(/".*$/, "", line)
        print line > "/home/joshua/song-title.txt"
        close("/home/joshua/song-title.txt")
        break
      }
    }
  }
'
