javascript: function getChildren(obj, lvl) {
  var ind = "";
  for (var j = 0; j < lvl; j++) ind += "  ";
  var s = "";
  for (var i = 0; i < obj.childNodes.length; i++) {
    var subobj = obj.childNodes[i];
    var nn = subobj.nodeName.toUpperCase();
    if (nn == "#comment" || nn.indexOf("!") == 0) {
      s += "\n  " + ind + "<!-- (comment) -->";
    } else if (nn.indexOf("#") == 0) {
      s += "\n  " + ind + subobj.nodeName;
    } else {
      s += "\n  " + ind + "<" + nn + ">";
      if (
        nn != "BR" &&
        nn != "HR" &&
        nn != "IMG" &&
        nn != "INPUT" &&
        nn != "META" &&
        nn != "LINK"
      ) {
        var attribs = "";
        for (var k = 0; k < subobj.attributes.length; k++) {
          if (subobj.attributes[k].specified)
            attribs +=
              subobj.attributes[k].nodeName +
              "=" +
              subobj.attributes[k].nodeValue +
              ", ";
        }
        if (attribs != "")
          s += " " + attribs.substring(0, attribs.length - 2) + "";
        s += getChildren(subobj, lvl + 1);
        s += "\n  " + ind + "</" + nn + ">";
      }
    }
  }
  return s;
}
W = open("", "", "resizable,scrollbars");
with (W.document) {
  writeln("HTML Tree for <b>" + window.location.href + "</b>");
  writeln(
    "<plaintext style='font:80% Verdana,Arial'>" +
      getChildren(document.documentElement, 0)
  );
  close();
}
