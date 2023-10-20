javascript: a = document.getElementsByTagName("*");
for (i = 0; i < a.length; i++) {
  a[i].setAttribute("contenteditable", "true");
}
href = document.getElementsByTagName("a");
for (i = 0; i < href.length; i++) {
  href[i].removeAttribute("href");
}
