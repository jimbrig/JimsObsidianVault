#' Paste Winslash - Addin Function
#'
#' @return normalized path character string
#' @export
#'
#' @details assign to keyboard shortcut Ctrl + Shift + P for easy access.
#'
#' @importFrom rstudioapi insertText
paste_winslash <- function() {

  out <- paste0(
    '"',
    normalizePath(utils::readClipboard(), winslash = "/"),
    '"'
  )

  rstudioapi::insertText(text = out)

  return(out)

}


# devtools::install_github('Timag/imageclipr')
