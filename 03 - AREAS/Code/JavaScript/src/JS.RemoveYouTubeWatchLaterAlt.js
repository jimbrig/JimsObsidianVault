setInterval(function () {
    document.querySelector('#primary button[aria-label="Action menu"]').click();
    var things = document.evaluate(
      '//span[contains(text(),"Watch later")]',
      document,
      null,
      XPathResult.ORDERED_NODE_SNAPSHOT_TYPE,
      null
    );
    for (var i = 0; i < things.snapshotLength; i++) {
      things.snapshotItem(i).click();
    }
  }, 1000);
