javascript: for (BM5 = 0; BM5 < document.links.length; BM5++) {
  if (document.links[BM5].style)
    with (document.links[BM5].style) {
      if (backgroundColor == "yellow") {
        void (backgroundColor = document.body.style.background);
      } else {
        void (backgroundColor = "yellow");
      }
    }
}
