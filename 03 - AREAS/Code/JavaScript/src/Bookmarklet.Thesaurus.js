javascript: var q = escape(window.getSelection()),
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
if (!q) void (q = prompt("Enter the word you want synonyms for%3A", ""));
if (q)
  void (location.href =
    "http://www.thesaurus.com/cgi-bin/search?config=roget&words=%27+q");
