document.addEventListener("turbolinks:load", function () {
  const player = document.querySelector("audio#song-player");

  document.querySelectorAll(".play-button").forEach(function(el) {
    el.addEventListener("click", function() {
      const button   = this;
      const songPath = (location.origin + button.dataset.song);

      if (player.src === songPath) {
        if (player.paused) {
          resumeSong(button);
        } else {
          pauseSong(button);
        }
      } else {
        playNewSong(button);
      }
    });
  });

  document.querySelectorAll("button#play-all").forEach(function(el) {
    el.addEventListener("click", function() {
      const button = document.querySelector(".song-item .play-button");

      playNewSong(button);
    });
  });

  player.addEventListener('ended', function(){
    const playing = document.querySelector(".song-item.playing");
    const next = playing.nextElementSibling;

    if (next !== null) {
      const playButton = next.querySelector('.play-button');

      playNewSong(playButton);
    } else {
      setButtonsAsNotPlaying();
    }
  });

  function setButtonsAsNotPlaying() {
    if (document.querySelectorAll(".song-item.playing").length > 0) {
      document.querySelectorAll(".song-item.playing").forEach(function (el) {
        el.classList.remove("playing");
      });
    }

    if (document.querySelectorAll(".song-item .play-button i.fa-pause-circle").length > 0) {
      document.querySelectorAll(".song-item .play-button i.fa-pause-circle").forEach(function (el) {
        el.classList.remove("fa-pause-circle");
        el.classList.add("fa-play-circle");
      });
    }
  }

  function playNewSong(button) {
    setButtonsAsNotPlaying();

    button.closest(".song-item").classList.add("playing");

    player.src = button.dataset.song;

    resumeSong(button);
    sendRecentlyHeard(button);
  }

  function pauseSong(button) {
    button.querySelector("i").classList.remove("fa-pause-circle");
    button.querySelector("i").classList.add("fa-play-circle");
    player.pause();
  }

  function resumeSong(button) {
    button.querySelector("i").classList.remove("fa-play-circle");
    button.querySelector("i").classList.add("fa-pause-circle");
    player.play();
  }

  function sendRecentlyHeard(button) {
    const token = document.querySelector('meta[name="csrf-token"]').content;
    const url = button.dataset.url;

    const xhr = new XMLHttpRequest();
    xhr.open("POST", url, true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.setRequestHeader('X-CSRF-Token', token);
    xhr.send();
  }
});
