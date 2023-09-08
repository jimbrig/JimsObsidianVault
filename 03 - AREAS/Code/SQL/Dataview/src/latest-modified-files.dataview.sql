TABLE file.ctime AS Created, file.mtime AS "Last modified"
WHERE file.name != this.file.name AND file.name != "CHANGELOG"
SORT file.mtime DESC
LIMIT 10
