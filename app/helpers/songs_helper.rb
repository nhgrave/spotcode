module SongsHelper
  def play_button song
    icon = content_tag :i, "", class: "fas fa-play-circle fa-2x"

    options = {
      class: "play-button has-text-white",
      data: {
        song: url_for(song.file),
        url: album_recently_heards_path(song.album)
      }
    }

    link_to icon, "javascript:void(0);", options
  end
end
