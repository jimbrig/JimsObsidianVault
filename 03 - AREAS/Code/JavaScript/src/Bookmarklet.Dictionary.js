javascript: function run() {
  var q = escape(window.getSelection()),
    i,
    ii;
  if (!q) {
    for (i = 0; i < frames.length; i++) {
      var fr = frames[i];
      try {
        q = escape(fr.getSelection());
      } catch (e) {}
      if (q) break;
      else {
        for (ii = 0; ii < fr.frames.length; ii++) {
          try {
            q = escape(fr.frames[ii].getSelection());
          } catch (e) {}
          if (q) break;
        }
      }
    }
  }
  if (!q) void (q = prompt("Enter word to define%3A", ""));
  if (q)
    void (location.href =
      "http://www.dictionary.com/cgi-bin/dict.pl?term=%27+q");
}
run();
void 0;
