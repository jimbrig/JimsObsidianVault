dt_buttons <- function(file_name = "downloaded_",
                       append_date = TRUE,
                       buttons = c("copy", "print", "csv", "excel", "pdf"),
                       text = "Download") {

  if (append_date) file_name <- paste0(file_name, Sys.Date())

  list('copy',
       'print',
       list(
         extend = 'collection',
         buttons = list(
           list(extend = 'csv'  , filename = file_name) ,
           list(extend = 'excel'  , filename = file_name) ,
           list(extend = 'pdf' , filename = file_name)
         ) ,
         text = 'Download'
       )
  )

}
