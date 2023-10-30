#' API - Request Authentication Middleware Filter
#'
#' @description
#' Uses `HTTP Basic Authentication` with `user = <user_uid>` and
#' `password = <Secret API key>` attached to the request's header to verify all
#' incoming `HTTP` requests.
#'
#' @param req,res Plumber request and response objects
#'
#' @family API Authentication
#' @seealso
#'   - [httr::authenticate()]
#'   - [plumber::forward()]
#'
#' @return on success [plumber::forward()] else an error
#' @export
#'
#' @importFrom config get
#' @importFrom fs path_package
#' @importFrom plumber forward
api_authenticate_request <- function(req, res) {

  # if running in local UI attach auth header and demo ID and forward
  if (grepl("docs|swagger|openapi", tolower(req$PATH_INFO))) {
    return(plumber::forward())
  }

  # config_file <- getOption("R_CONFIG_FILE", fs::path_package("powwaterapi", "config/config.yml"))
  secret_key <- "secretkey" # config::get("api")$secretkey
  auth_header <- req[["HTTP_AUTHORIZATION"]]
  err_out <- NULL

  tryCatch({

    if (is.null(auth_header)) {
      res$status <- 401L
      stop("Authentication header cannot be NULL.", call. = FALSE)
    }

    # parse auth header into id and key
    parsed_auth_header <- parse_auth_header(auth_header)
    user_uid <- parsed_auth_header$user_uid
    supplied_key <- parsed_auth_header$supplied_key

    # check supplied secret API key
    if (supplied_key != secret_key) {
      res$status <- 401L
      stop("API keys do not match.", call. = FALSE)
    }

    # attach verification to req
    req$key_validated <- TRUE

    # check for blank user_uid
    if (is.na(user_uid) || is.null(user_uid) || user_uid == "") {
      req$user_uid <- ""
    } else {
      req$user_uid <- user_uid
      if (exists("app_name", req$args)) req$app_name <- req$args$app_name
    }
  }, error = function(err) {
    print(list("Error in Authentication Filter: " = err$message))
    if (res$status == 200L) res$status <- 500L
    err_out <<- err$message
    invisible()
  })

  if (!is.null(err_out)) return(list(error = err_out))

  plumber::forward()

}

#' API - User Authentication Filter
#'
#' @description
#' Similar to the [api_authenticate_request()] filter function, this function
#' performs a filter on all incoming `HTTP` requests in order to cross-validate
#' the user against our `users` database table. This filter also attaches the
#' detected `user_type` (i.e. customer, rider, vendor, admin) to the response
#' body for later endpoints to use as necessary.
#'
#' @inheritParams api_authenticate_request
#'
#' @family API Authentication
#'
#' @return on success [plumber::forward()] else an error
#' @export
#'
#' @importFrom plumber forward
api_authenticate_user <- function(req, res) {

  # if running in local UI attach auth header and demo ID and forward
  if (grepl("docs|swagger|openapi", tolower(req$PATH_INFO))) {
    return(plumber::forward())
  }

  if (is.null(req$user_uid) || req$user_uid == "") {
    res$status <- 401L # not authorized
    return(list("Error" = "Not Authorized"))
  }

  plumber::forward()
}


#' API Get Authentication Check
#'
#' @description
#' An `HTTP` `GET` request endpoint for retrieving user's authentication status.
#' Calls the endpoint located at path `/auth-check`.
#'
#' @inheritParams api_authenticate_request
#'
#' @family API Authentication
#'
#' @return on success, a list containing `message`, `user_uid`, and `user_type`;
#'   on failure a list containing the `error` "Not Authorized".
#' @export
api_get_auth_check <- function(req, res) {

  if (!("user_uid" %in% names(req))) {
    return(list("Error" = "Not Authorized"))
  } else {
    return(list(
      message = "User Successfully Authenticated",
      user_uid = req$user_uid,
      user_type = req$app_name
    ))
  }

}

#' Parse Authentication Header
#'
#' @description
#' Parse a plumber API request's authentication header into `user_uid` and
#'   `apikey` (password).
#'
#' @param auth_header Authentication Header from the plumber `req` request.
#'
#' @family API Authentication
#'
#' @return list containing `user_uid` and `apikey`
#' @export
#'
#' @importFrom base64enc base64decode
#' @importFrom purrr pluck
parse_auth_header <- function(auth_header) {

  hold <- strsplit(auth_header, " ")[[1]][2] %>%
    base64enc::base64decode() %>%
    rawToChar() %>%
    strsplit(":") %>%
    purrr::pluck(1)

  user_id <- hold[[1]]
  supplied_key <- hold[[2]]

  out <- list(
    "user_uid" = user_id,
    "supplied_key" = supplied_key
  )

  out
}

#' @keywords internal
#' @noRd
get_customer_uids <- function(conn, ...) {
  pull_db(conn = conn, tbl = "customers", col = "uid")
}

#' @keywords internal
#' @noRd
get_rider_uids <- function(conn, ...) {
  pull_db(conn = conn, tbl = "riders", col = "uid")
}

#' @keywords internal
#' @noRd
get_polished_users <- function(conn, ...) {
  pull_db(conn = conn, tbl = "users", schema = "polished", col = "uid")
}

#' @keywords internal
#' @noRd
get_mobile_users <- function(conn, ...) {
  pull_db(conn = conn, tbl = "mobile_users", col = "uid")
}

#' @keywords internal
#' @noRd
get_vendor_users <- function(conn, ...) {
  pull_db(conn = conn, tbl = "vendor_users", col = "user_uid")
}



# googleCloudStorageR::gcs_global_bucket("powapi")
# gcs_cache <- memoise::cache_gcs(cache_name = googleCloudStorageR::gcs_get_global_bucket())
# get_customer_uids_m <- memoise::memoise(get_customer_uids, cache = gcs_cache)
# get_rider_uids_m <- memoise::memoise(get_rider_uids, cache = gcs_cache)
# get_polished_users_m <- memoise::memoise(get_polished_users, cache = gcs_cache)
# get_mobile_users_m <- memoise::memoise(get_mobile_users, cache = gcs_cache)
# get_vendor_users_m <- memoise::memoise(get_vendor_users, cache = gcs_cache)
