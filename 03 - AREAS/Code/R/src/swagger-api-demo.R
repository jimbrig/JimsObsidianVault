swagger_viewer <- function(json_doc) {
  folder_path <- fs::path_temp("swagger")
  if (!fs::dir_exists(folder_path)) {
    fs::dir_copy(swagger::swagger_path(), folder_path)
  }
  fs::file_copy(json_doc, folder_path)
  index <- xfun::read_utf8(fs::path_temp("swagger", "index.html"))
  index_new <- gsub("http://petstore.swagger.io/v2/swagger.json", json_doc, index)
  xfun::write_utf8(index_new, fs::path_temp("swagger", "index.html"))
  rstudioapi::viewer(fs::path_temp("swagger", "index.html"))
}

# swagger::swagger_path()
# swagger_viewer("node_modules/.package-lock.json")



