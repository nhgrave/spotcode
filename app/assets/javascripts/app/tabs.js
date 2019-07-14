document.addEventListener("turbolinks:load", function () {
  document.addEventListener('click', function(e) {
    if (e.target.nodeName === "A" && e.target.closest(".tabs.shared") !== null) {
      const target = e.target.getAttribute("target");
      const listItems = document.querySelectorAll(".tabs.shared li");
      const contentitems = document.querySelectorAll(".tabs-content .tab-item");

      listItems.forEach(element => element.classList.remove("is-active") );
      contentitems.forEach(element => element.classList.remove("active") );

      e.target.closest("li").classList.add("is-active");
      document.querySelector(`.tabs-content .tab-item${target}`).classList.add("active");
    }
  });
});
