javascript: (function () {
  var t = (window.WFP = window.WFP || {}),
    e = "https:" === window.location.protocol ? "https:" : "http:";
  (t.bookmarklet = 3),
    t.Picker && t.Picker.show(),
    t.attached ||
      t.Picker ||
      ((function (t) {
        var e = document.createElement("link");
        (e.rel = "stylesheet"),
          (e.type = "text/css"),
          (e.href = t),
          document.head.appendChild(e);
      })(e + "//gavrilov.co.uk/wfp/WFP.css"),
      (function (t) {
        var e = document.createElement("script");
        (e.type = "text/javascript"), (e.src = t), document.head.appendChild(e);
      })(e + "//gavrilov.co.uk/wfp/WFP.full.min.js"),
      (t.attached = !0));
})();
