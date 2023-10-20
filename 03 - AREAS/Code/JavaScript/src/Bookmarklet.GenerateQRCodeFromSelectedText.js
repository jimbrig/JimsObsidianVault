javascript: void(() => {
  open('https://chart.apis.google.com/chart?cht=qr&chs=300x300&chld=L|2&chl=' + (prompt('Enter text for QR code:') ?? (function() {
      throw null;
  }())), null, 'location=no,status=yes,menubar=no,scrollbars=no,resizable=yes,width=500,height=500,modal=yes,dependent=yes')
})();
