---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://kieranhealy.org/blog/archives/2023/03/25/reading-remote-data-files/
Tags: ["#Type/Highlight/Article"]
Aliases: ["Reading Remote Data Files", "Reading Remote Data Files"]
---
# Reading Remote Data Files

## Metadata
- Author: [[Kieran Healy]]
- Full Title: Reading Remote Data Files
- Category: #Type/Highlight/Article
- URL: https://kieranhealy.org/blog/archives/2023/03/25/reading-remote-data-files/

## Highlights
- Now, if these were provided as CSVs our task would be a little easier because in addition to being able to deal with a vector of filenames at once, `read_csv()`, and indeed all the read-in functions in `readr` in general, will happily read URLs as well as local file paths. However, the `read_xlsx()` function in the `readxl` package can’t do this yet. It only wants file paths. A second issue is that the Excel files themselves are not entirely tidy. At the top they look like this: ([View Highlight](https://read.readwise.io/read/01gyttewdfb0t1kgnw3r6drgep))
- But the first order of business is getting a vector of the actual file URLs to download. You could just copy and paste the listing, like an animal, but we are not going to do that. Instead, we’ll take advantage of the old-school empty-directory listing to get the file names. We’ll do this using R’s implementation of `curl`. ([View Highlight](https://read.readwise.io/read/01gyttfc4swkcrhk9c9vwrvcdy))
- url_loc <- "ftp.cdc.gov/pub/Health_Statistics/NCHS/Publications/NVSR/71-02/" ## Prepare the connection list_files <- curl::new_handle() curl::handle_setopt(list_files, ftp_use_epsv = TRUE, dirlistonly = TRUE) ## Open the connection as an FTP listing con <- curl::curl(url = paste0("ftp://", url_loc), open = "r", handle = list_files) ## Get the file names files <- readLines(con) ## Close the connection close(con) ([View Highlight](https://read.readwise.io/read/01gyttfpxcb4qsjmfbk53xsqrv))
