```dataviewjs
// Render a simple table of book info sorted by rating.
const table = dv.markdownTable(
	["File", "Path", "Date"],
	dv.pages('-#Type/Daily')
		.filter(b => b.Date !== "" ? b.Date : undefined)
		.filter(b => b.Date !== "<% tp.date.now() %>")
		.filter(b => b.file.name !== "_README" && b.file.name !== "Untitled")
		.sort(b => b.Date, 'desc')
		.map(b => [b.file.link, dv.fileLink(b.file.path, false, b.file.path), b.Date]));
dv.paragraph(table);
```