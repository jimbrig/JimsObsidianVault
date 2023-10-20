javascript: function run() {
  var d = document,
    da = new Date(),
    b = d.body,
    p = "https:" == document.location.protocol ? "https://" : "http://",
    ex = d.getElementById("twkmSEOScript");
  try {
    if (!b) throw 0;
    if (!ex) {
      z = d.createElement("scr" + "ipt");
      z.setAttribute(
        "src",
        p +
          "twkm.ca/min/f=gadgets/resources/seo-bookmarklet/seo-latest.js?ts=" +
          da.getTime()
      );
      z.setAttribute("id", "twkmSEOScript");
      z.setAttribute("class", "03");
      b.appendChild(z);
    } else {
      twkm_closeThisBox();
    }
  } catch (e) {
    alert("Please wait until the page has loaded.");
  }
}
run();
void 0;
