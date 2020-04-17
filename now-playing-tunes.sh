dbus-monitor --session "path=/org/mpris/MediaPlayer2" --monitor | awk '
  /string  *"xesam:artist/{
    while (1) {
      getline line
      if (line ~ /string "/){
        sub(/.*string "/, "artist:", line)
        sub(/".*$/, "", line)
        print line > "/home/joshua/song.txt"
        close("/home/joshua/song.txt")
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
        print line > "/home/joshua/song2.txt"
        close("/home/joshua/song2.txt")
        break
      }
    }
  }
'
