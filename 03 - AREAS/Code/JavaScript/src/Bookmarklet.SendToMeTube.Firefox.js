javascript: (function () {
  xhr = new XMLHttpRequest();
  xhr.open("POST", "https://metube.domain.com/add");
  xhr.send(JSON.stringify({ url: document.location.href, quality: "best" }));
  xhr.onload = function () {
    if (xhr.status == 200) {
      alert("Sent to metube!");
    } else {
      alert("Send to metube failed. Check the javascript console for clues.");
    }
  };
})();
