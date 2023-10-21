#  ------------------------------------------------------------------------
#
# Title : ShinyApps.io Accounts Setup Script
#    By : Jimmy Briggs
#  Date : 2023-01-28
#
#  ------------------------------------------------------------------------

require(rsconnect)
require(config)
require(purrr)

conf <- config::get("shinyappsio", file = r_config_dir("config/rsconnect/shinyappsio.config.yml"))

params <- list(
  account = conf$accounts,
  token = conf$token,
  secret = conf$secret
)

purrr::pwalk(
  params,
  function(account, token, secret) {
    rsconnect::setAccountInfo(
      name = account,
      token = token,
      secret = secret
    )
  }
)
