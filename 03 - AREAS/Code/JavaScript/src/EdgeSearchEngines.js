// export search engines
// based on https://superuser.com/a/1626575
// visit edge://settings/searchEngines, run in Developer Tools (F12)
(function exportSEs() {
    // auxiliary function to download a file with the exported data
    function downloadData(filename, data) {
      const file = new File([data], { type: 'text/json' });
      const elem = document.createElement('a');
      elem.href = URL.createObjectURL(file);
      elem.download = filename;
      elem.click();
    }
    let searchEngines = [];
    document.querySelectorAll('[role="row"][data-rowid]')
      .forEach($el => {
        searchEngines.push(
        {
          name: $el.querySelectorAll('[role="gridcell"]')[0].textContent,
          keyword: $el.querySelectorAll('[role="gridcell"]')[1].textContent,
          url: $el.querySelectorAll('[role="gridcell"]')[2].textContent,
        })}
      )
      downloadData('search_engines.json', JSON.stringify(searchEngines));
  }());

// import search engines
(async function importSEs() {
  // auxiliary function to open a file selection dialog
  function selectFileToRead() {
    return new Promise((resolve) => {
      const input = document.createElement('input');
      input.setAttribute('type', 'file');
      input.addEventListener('change', (e) => {
        resolve(e.target.files[0]);
      }, false);
      input.click();
    });
  }
  // auxiliary function to read data from a file
  function readFile(file) {
    return new Promise((resolve) => {
      const reader = new FileReader();
      reader.addEventListener('load', (e) => {
        resolve(e.target.result);
      });
      reader.readAsText(file);
    });
  }
  const file = await selectFileToRead();
  const content = await readFile(file);
  const searchEngines = JSON.parse(content);
  searchEngines.forEach(({ name, keyword, url }) => {
    // actual search engine import magic
    chrome.send('searchEngineEditStarted', [-1]);
    chrome.send('searchEngineEditCompleted', [name, keyword, url]);
  });
}());
