javascript: (function () {
  if (window.ouiseo === undefined) {
    var jsCode = document.createElement("script");
    jsCode.setAttribute(
      "src",
      "//carlsednaoui.s3.amazonaws.com/ouiseo/ouiseo.min.js"
    );
    document.body.appendChild(jsCode);
  } else if (!!window.ouiseo && !document.getElementById("ouiseo")) {
    ouiseo();
  } else {
    console.log("ouiseo is already open");
  }
})();
