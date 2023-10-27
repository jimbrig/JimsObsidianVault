<%*
const fs = require
const basePath = app.vault.adapter.basePath
const inputFile = tp.frontmatter.input_file
const language = inputFile.split('.').pop()
// console.log("\n", basePath, inputFile, language)
const text = fs.readFileSync(basePath + inputFile)
tR += `Source: <code>${inputFile}</code>\n~~~~${language}\n${text}\n~~~~\n`
%>
