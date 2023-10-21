
library(futile.logger)
library(utils)

retry <- function(expr,
                  isError = function(x) "try-error" %in% class(x),
                  maxErrors = 3,
                  sleep = 1) {

  requireNamespace("futile.logger")
  requireNamespace("utils")

  attempts = 0
  retval = try(eval(expr))

  while (isError(retval)) {
    print(eval(expr))

    attempts = attempts + 1

    if (attempts >= maxErrors) {
      msg = sprintf("retry: too many retries [[%s]]", utils::capture.output(utils::str(retval)))
      futile.logger::flog.fatal(msg)
      stop(msg)

    } else {
      msg = sprintf(
        "retry: error in attempt %i/%i [[%s]]",
        attempts,
        maxErrors,
        utils::capture.output(utils::str(retval))
      )
      futile.logger::flog.error(msg)
      warning(msg)
    }

    if (sleep > 0)
      Sys.sleep(sleep)

    retval = try(eval(expr))

  }

  return(retval)

}
