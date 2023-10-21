httpStatus <- function(code) {
  descriptions <- list(
    "100" = "Continue",
    "101" = "Switching Protocols",
    "200" = "OK",
    "201" = "Created",
    "202" = "Accepted",
    "203" = "Non-Authoritative Information",
    "204" = "No Content",
    "205" = "Reset Content",
    "206" = "Partial Content",
    "300" = "Multiple Choices",
    "301" = "Moved Permanently",
    "302" = "Found",
    "303" = "See Other",
    "304" = "Not Modified",
    "305" = "Use Proxy",
    "307" = "Temporary Redirect",
    "400" = "Bad Request",
    "401" = "Unauthorized",
    "402" = "Payment Required",
    "403" = "Forbidden",
    "404" = "Not Found",
    "405" = "Method Not Allowed",
    "406" = "Not Acceptable",
    "407" = "Proxy Authentication Required",
    "408" = "Request Timeout",
    "409" = "Conflict",
    "410" = "Gone",
    "411" = "Length Required",
    "412" = "Precondition Failed",
    "413" = "Request Entity Too Large",
    "414" = "Request-URI Too Long",
    "415" = "Unsupported Media Type",
    "416" = "Requested Range Not Satisifable",
    "417" = "Expectation Failed",
    "500" = "Internal Server Error",
    "501" = "Not Implemented",
    "502" = "Bad Gateway",
    "503" = "Service Unavailable",
    "504" = "Gateway Timeout",
    "505" = "HTTP Version Not Supported"
  )
  description <- descriptions[[as.character(code)]]
  if (is.null(description)) {
    description <- "Dunno"
  }
  paste(code, description, sep = " - ")
}

errorHandler <- function(req, res, err) {
  errmsg <- as.character(err)
  li <- list()
  res[["serializer"]] <- serializer_unboxed_json()
  if (res[["status"]] == 200L) {
    res[["status"]] <- 500L
    li[["error"]] <- httpStatus(500L)
    if (!is.null(status <- attr(err[["message"]], "status"))) {
      res[["status"]] <- status
      li[["error"]] <- httpStatus(status)
    }
  } else {
    li[["error"]] <- httpStatus(500L)
  }
  if (is.function(req[["pr"]][["getDebug"]]) && isTRUE(req[["pr"]][["getDebug"]]())) {
    li["message"] <- errmsg
  }
  return(li)
}

#* @plumber
function(pr) {
  pr %>%
    pr_set_error(errorHandler)
}
