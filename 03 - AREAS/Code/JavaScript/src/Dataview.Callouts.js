// Replace TAG with whatever tag you wish.
const pages = dv.pages('#TAG')

//Use the regular expression to define what kind of Callout you want to check
//Replace !todo with whatever callout type you wish.
const regex = />\s\[\!todo\]\s(.+?)((\n>\s.*?)*)\n/

//check for more types of callouts by adding new const regex# where # is a number
const regex2 = />\s\[\!TODO\]\s(.+?)((\n>\s.*?)*)\n/

const rows = []
for (const page of pages) {
    const file = app.vault.getAbstractFileByPath(page.file.path);
    //get file path as string
    var checkMe = "" + page.file.path;
    // Read the file contents
    const contents = await app.vault.read(file)
    // Extract the summary via regex
    for (const callout of contents.match(new RegExp(regex, 'sg')) || []) {

        //check if the file path is in your designated file path.
        //change FILEPATH to any keyword, folder name, or file path
        //You can also change to exclude a file path by changing "==true" to "!=true"
        if (checkMe.includes('FILEPATH') == true) {
            const match = callout.match(new RegExp(regex, 's'))
            rows.push([match[1], page.file.link])
        }
    }

    //duplicate the for loop for each const regex# you created
    //adjust regex to the appropriate name
    for (const callout of contents.match(new RegExp(regex2, 'sg')) || []) {
        if (checkMe.includes('FILEPATH') == true) {
            const match = callout.match(new RegExp(regex2, 's'))
            rows.push([match[1], page.file.link])
        }
    }
}

dv.table(['Term', 'Link'], rows)
