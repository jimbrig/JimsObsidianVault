/**
* Bookmarklet to add the current page to ReadWise
*/
javascript: (
  function () {
    /**
    * Open the ReadWise page with the current page's title and URL
    * @function open
    * @param {string} url
    * @returns {string} Encoded URL for ReadWise
    */
    open(
      "https://readwise.io/save?title=" +
        encodeURIComponent(document.title) +
        "&url=" +
        encodeURIComponent(location.href)
    );
  }
)();
