/*
Insert a table-of-contents anywhere with:

```dataviewjs
dv.view('toc')
```

You can specify some optional parameters:

```dataviewjs
dv.view('toc', {
    style: '-', // change to bullet style instead of number style
    level: 2, // start at level number X (ignore the levels preceeding that)
    heading: false // disable the "Table of contents" heading
})
```
*/
const startAtLevel = input?.level || 2
const content = await dv.io.load(dv.current().file.path)
let counter = [0, startAtLevel]
const toc = content.match(new RegExp(`^#{${startAtLevel},} \\S.*`, 'mg'))
    .map(heading => {
        const [_, level, text] = heading.match(/^(#+) (.+)$/)
        const link = dv.current().file.path + '#' + text
        if (level.length > counter[1]) {
            counter[0]++
        } else if (level.length < counter[1]) {
            counter[0] = Math.max(0, counter[0] - 1)
        }
        counter[1] = level.length
        return '\t'.repeat(counter[0]) + `${input?.style || '1.'} [[${link}|${text}]]`
    })
if (input?.heading !== false) {
    dv.header(2, 'Contents')
}
dv.paragraph(toc.join('\n'))
