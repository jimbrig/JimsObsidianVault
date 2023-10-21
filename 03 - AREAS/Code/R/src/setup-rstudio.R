
#  ------------------------------------------------------------------------
#
# Title : RStudio Setup
#    By : Jimmy Briggs
#  Date : 2020-12-17
#
#  ------------------------------------------------------------------------


# setup -------------------------------------------------------------------
if (!require("pacman")) install.packages("pacman"); library(pacman)
pacman::p_load(
  rstudioapi,
  jsonlite,
  yaml,
  pak
)
pacman::p_load_current_gh(
  "gadenbuie/rsthemes"
)
httr::set_cookies()

heads <- c("Connection" = "keep-alive",
           "Pragma" = "no-cache",
           "Cache-Control" = "no-cache",
           "DNT" = "1",
           "Upgrade-Insecure-Requests" = "1",
           "User-Agent" =  "Mozilla/5.0")


httr::GET("https://my.callofduty.com/api/papi-client/stats/cod/v1/title/cw/platform/xbl/gamer/munchinxbox69/profile/type/mp",
          add_headers(.headers = heads),
          set_cookies())

r <- httr::GET("my.callofduty.com/api/papi-client/stats/cod/v1/title/cw/platform/xbl/gamer/munchinxbox69/profile/type/mp", #"/api/papi-client/stats/cod/v1/title/cw/platform/xbl/gamer/munchinxbox69/profile/type/mp",
               httr::user_agent("Mozilla/5.0"),
               httr::set_cookies(
                 "ACT_SSO_COOKIE_EXPIRY" =" 1609396002504",
                 "ACT_SSO_REMEMBER_ME" = "MTQwODcyMzg6JDJhJDEwJC5pR2xRSE1nQkhWRk5TRmxpZ1FGTWU5MTVUUTJjblV6bEdRTTlyQk4zcS8zMmJ6aExEb09t"
                 )
)
library(magrittr)

x <- system(intern=T, 'curl "https://my.callofduty.com/api/papi-client/stats/cod/v1/title/cw/platform/xbl/gamer/munchinxbox69/profile/type/mp" -H "Connection: keep-alive" -H "Pragma: no-cache" -H "Cache-Control: no-cache" -H "DNT: 1" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4351.0 Safari/537.36 Edg/89.0.738.0" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" -H "Sec-Fetch-Site: none" -H "Sec-Fetch-Mode: navigate" -H "Sec-Fetch-User: ?1" -H "Sec-Fetch-Dest: document" -H "Accept-Language: en-US,en;q=0.9" -H "Cookie: _gcl_au=1.1.371092191.1607839219; _ga=GA1.3.357333076.1607839223; CRM_BLOB=eyJ2ZXIiOjEsInBsYXQiOnsieCI6eyJ2IjowLCJ0Ijp7ImJvNCI6eyJtcCI6bnVsbCwieiI6bnVsbCwicHJlcyI6MTEuMCwic3AiOjAuMCwibGV2Ijo1Ni4wfX19fX0; tfa_enrollment_seen=true; ssoDevId=7f52267380f743139cd4ca938e701783; optimizelyEndUserId=oeu1607839470677r0.07867353186876391; _scid=6b68c5f0-6da6-47cf-a9c1-d1b76adf3289; _sctr=1^|1607835600000; aamoptsegs=aam^%^3D16648913^%^2Caam^%^3D16187168; _ga=GA1.2.1621120958.1607847121; _fbp=fb.1.1607847124830.1194777766; _gid=GA1.3.1009447306.1608186381; ACT_SSO_COOKIE=MTQwODcyMzg6MTYwOTM5NjAwMjUwNDpjNzJiNmJkYjczN2RmOTRkNzQ2OGNlODk1ODhkZmQ4MQ; ACT_SSO_COOKIE_EXPIRY=1609396002504; ACT_SSO_REMEMBER_ME=MTQwODcyMzg6JDJhJDEwJC5pR2xRSE1nQkhWRk5TRmxpZ1FGTWU5MTVUUTJjblV6bEdRTTlyQk4zcS8zMmJ6aExEb09t; _abck=8F01B975AF1407A54E3FCD2B3F25BCA3~0~YAAQOMDOF6rT80t2AQAA1xhhbwW4xwLakyG6NAGaxybXF9RcxI4c79cx1iXb4HcmT2t3p4j2UUiAb7OLINDnsxHv4Y9E21aUEgzzz3RDmXX/bUIa17Jto5wq4WWA+wKBVQiHhpgSkw5Vs6fjTYR7cbO3969jxzOZ+4gZL3d3SUb9W8fRFC9CpKrDGDK1ayOVWTsTUjAjlkPlUI7VZPRBSeQZdjFwc2Sk/g28ozlqgSiLNeJsBG1N85GApzWGqxr+ek1+1ITAUe2SkKgUYs1v8ZQfb3qQPQFXmgi08cnYuYclyoq4IOSP5By0RVXR3FWR+7N2aj7bTAObZnwUG1HoZO9WzkMGSEcgp9Y=~-1~-1~-1; AMCV_0FB367C2524450B90A490D4C^%^40AdobeOrg=-637568504^%^7CMCIDTS^%^7C18614^%^7CMCMID^%^7C86476226826632331832083577158936441323^%^7CMCAAMLH-1608791198^%^7C6^%^7CMCAAMB-1608791198^%^7C6G1ynYcLPuiQxYZrsz_pkqfLG9yMXBpb2zX5dvJdYQJzPXImdj0y^%^7CMCOPTOUT-1608193599s^%^7CNONE^%^7CMCAID^%^7CNONE^%^7CMCSYNCSOP^%^7C411-18618^%^7CvVersion^%^7C5.1.1^%^7CMCCIDH^%^7C1956761501; OptanonConsent=isIABGlobal=false&datestamp=Thu+Dec+17+2020+01^%^3A26^%^3A42+GMT-0500+(Eastern+Standard+Time)&version=6.8.0&hosts=&consentId=725daed6-f572-4bb7-9858-72ecb8d8052a&interactionCount=1&landingPath=NotLandingPage&groups=1^%^3A1^%^2C2^%^3A1^%^2C3^%^3A1^%^2C4^%^3A1&AwaitingReconsent=false; s_nr=1608186483335-Repeat; API_CSRF_TOKEN=da3bdf26-0e12-414c-b5c4-db1c055777f9; ak_bmsc=CE1938E638B6ED97126FA8F7A48C4C231730FE35E1790000AA1EDC5FF416FD01~plR+O+spqoIZlI74C9vz8rwdSwyUgkVV/BLdXK11/Tbu2vlCR9rOEZRv81iyNxvApS1KuF6gsD/OV3q9eI6ivqIFTP7XkoFt/K5LGSjIqGr+mXW3naGndARA8Fpv6agr/bDbdbdmXMkrlp6jyHIE1W+qdbHol/g/K14fAqT/Zy2uP+DJxPOiObfZgKyZIQuL2uvevrB1kwtnWK1t2OzeDDHfOxLBcsLbk2wauGdvLVXlMjjw714D1KeQUyBOpigCQ9; bm_sv=C4B5098C294BC2F405DC0B9402C3007F~PIBt1udoaybsJgCSe7A3/PW1gncNyMAIf7w8RM+t1oD8H7D9yRwUeZhS4/UFeIxkgUhobmYNLL662CwxQfbuDYJstEfHPGxVesWnu+V32GPUKcaApht/eaZlvaKLlWRlZW79civPlG3VpaA2tM6+qA=="')


GET('https://my.callofduty.com/api/papi-client/stats/cod/v1/title/cw/platform/xbl/gamer/munchinxbox69/profile/type/mp',
add_headers('Host: my.callofduty.com
Connection: keep-alive
Pragma: no-cache
Cache-Control: no-cache
DNT: 1
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4351.0 Safari/537.36 Edg/89.0.738.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
Sec-Fetch-Site: none
Sec-Fetch-Mode: navigate
Sec-Fetch-User: ?1
Sec-Fetch-Dest: document
Accept-Encoding: gzip, deflate, br
Accept-Language: en-US,en;q=0.9
Cookie: _gcl_au=1.1.371092191.1607839219; _ga=GA1.3.357333076.1607839223; CRM_BLOB=eyJ2ZXIiOjEsInBsYXQiOnsieCI6eyJ2IjowLCJ0Ijp7ImJvNCI6eyJtcCI6bnVsbCwieiI6bnVsbCwicHJlcyI6MTEuMCwic3AiOjAuMCwibGV2Ijo1Ni4wfX19fX0; tfa_enrollment_seen=true; ssoDevId=7f52267380f743139cd4ca938e701783; optimizelyEndUserId=oeu1607839470677r0.07867353186876391; _scid=6b68c5f0-6da6-47cf-a9c1-d1b76adf3289; _sctr=1|1607835600000; aamoptsegs=aam%3D16648913%2Caam%3D16187168; _ga=GA1.2.1621120958.1607847121; _fbp=fb.1.1607847124830.1194777766; _gid=GA1.3.1009447306.1608186381; ACT_SSO_COOKIE=MTQwODcyMzg6MTYwOTM5NjAwMjUwNDpjNzJiNmJkYjczN2RmOTRkNzQ2OGNlODk1ODhkZmQ4MQ; ACT_SSO_COOKIE_EXPIRY=1609396002504; ACT_SSO_REMEMBER_ME=MTQwODcyMzg6JDJhJDEwJC5pR2xRSE1nQkhWRk5TRmxpZ1FGTWU5MTVUUTJjblV6bEdRTTlyQk4zcS8zMmJ6aExEb09t; _abck=8F01B975AF1407A54E3FCD2B3F25BCA3~0~YAAQOMDOF6rT80t2AQAA1xhhbwW4xwLakyG6NAGaxybXF9RcxI4c79cx1iXb4HcmT2t3p4j2UUiAb7OLINDnsxHv4Y9E21aUEgzzz3RDmXX/bUIa17Jto5wq4WWA+wKBVQiHhpgSkw5Vs6fjTYR7cbO3969jxzOZ+4gZL3d3SUb9W8fRFC9CpKrDGDK1ayOVWTsTUjAjlkPlUI7VZPRBSeQZdjFwc2Sk/g28ozlqgSiLNeJsBG1N85GApzWGqxr+ek1+1ITAUe2SkKgUYs1v8ZQfb3qQPQFXmgi08cnYuYclyoq4IOSP5By0RVXR3FWR+7N2aj7bTAObZnwUG1HoZO9WzkMGSEcgp9Y=~-1~-1~-1; AMCV_0FB367C2524450B90A490D4C%40AdobeOrg=-637568504%7CMCIDTS%7C18614%7CMCMID%7C86476226826632331832083577158936441323%7CMCAAMLH-1608791198%7C6%7CMCAAMB-1608791198%7C6G1ynYcLPuiQxYZrsz_pkqfLG9yMXBpb2zX5dvJdYQJzPXImdj0y%7CMCOPTOUT-1608193599s%7CNONE%7CMCAID%7CNONE%7CMCSYNCSOP%7C411-18618%7CvVersion%7C5.1.1%7CMCCIDH%7C1956761501; OptanonConsent=isIABGlobal=false&datestamp=Thu+Dec+17+2020+01%3A26%3A42+GMT-0500+(Eastern+Standard+Time)&version=6.8.0&hosts=&consentId=725daed6-f572-4bb7-9858-72ecb8d8052a&interactionCount=1&landingPath=NotLandingPage&groups=1%3A1%2C2%3A1%2C3%3A1%2C4%3A1&AwaitingReconsent=false; s_nr=1608186483335-Repeat; API_CSRF_TOKEN=da3bdf26-0e12-414c-b5c4-db1c055777f9; ak_bmsc=CE1938E638B6ED97126FA8F7A48C4C231730FE35E1790000AA1EDC5FF416FD01~plR+O+spqoIZlI74C9vz8rwdSwyUgkVV/BLdXK11/Tbu2vlCR9rOEZRv81iyNxvApS1KuF6gsD/OV3q9eI6ivqIFTP7XkoFt/K5LGSjIqGr+mXW3naGndARA8Fpv6agr/bDbdbdmXMkrlp6jyHIE1W+qdbHol/g/K14fAqT/Zy2uP+DJxPOiObfZgKyZIQuL2uvevrB1kwtnWK1t2OzeDDHfOxLBcsLbk2wauGdvLVXlMjjw714D1KeQUyBOpigCQ9; bm_sv=C4B5098C294BC2F405DC0B9402C3007F~PIBt1udoaybsJgCSe7A3/PW1gncNyMAIf7w8RM+t1oD8H7D9yRwUeZhS4/UFeIxkgUhobmYNLL662CwxQfbuDYJstEfHPGxVesWnu+V32GPUKcaApht/eaZlvaKLlWRlZW79civPlG3VpaA2tM6+qA==
  '))

                 "_gcl_au" = "1.1.371092191.1607839219",
                                 "_ga" =" GA1.3.357333076.1607839223",
                                 "CRM_BLOB"="eyJ2ZXIiOjEsInBsYXQiOnsieCI6eyJ2IjowLCJ0Ijp7ImJvNCI6eyJtcCI6bnVsbCwieiI6bnVsbCwicHJlcyI6MTEuMCwic3AiOjAuMCwibGV2Ijo1Ni4wfX19fX0; tfa_enrollment_seen=true; ssoDevId=7f52267380f743139cd4ca938e701783; optimizelyEndUserId=oeu1607839470677r0.07867353186876391; _scid=6b68c5f0-6da6-47cf-a9c1-d1b76adf3289; _sctr=1|1607835600000; aamoptsegs=aam%3D16648913%2Caam%3D16187168; _ga=GA1.2.1621120958.1607847121; _fbp=fb.1.1607847124830.1194777766; _gid=GA1.3.1009447306.1608186381; ACT_SSO_COOKIE=MTQwODcyMzg6MTYwOTM5NjAwMjUwNDpjNzJiNmJkYjczN2RmOTRkNzQ2OGNlODk1ODhkZmQ4MQ; ACT_SSO_COOKIE_EXPIRY=1609396002504; ACT_SSO_REMEMBER_ME=MTQwODcyMzg6JDJhJDEwJC5pR2xRSE1nQkhWRk5TRmxpZ1FGTWU5MTVUUTJjblV6bEdRTTlyQk4zcS8zMmJ6aExEb09t; _abck=8F01B975AF1407A54E3FCD2B3F25BCA3~0~YAAQOMDOF6rT80t2AQAA1xhhbwW4xwLakyG6NAGaxybXF9RcxI4c79cx1iXb4HcmT2t3p4j2UUiAb7OLINDnsxHv4Y9E21aUEgzzz3RDmXX/bUIa17Jto5wq4WWA+wKBVQiHhpgSkw5Vs6fjTYR7cbO3969jxzOZ+4gZL3d3SUb9W8fRFC9CpKrDGDK1ayOVWTsTUjAjlkPlUI7VZPRBSeQZdjFwc2Sk/g28ozlqgSiLNeJsBG1N85GApzWGqxr+ek1+1ITAUe2SkKgUYs1v8ZQfb3qQPQFXmgi08cnYuYclyoq4IOSP5By0RVXR3FWR+7N2aj7bTAObZnwUG1HoZO9WzkMGSEcgp9Y=~-1~-1~-1; AMCV_0FB367C2524450B90A490D4C%40AdobeOrg=-637568504%7CMCIDTS%7C18614%7CMCMID%7C86476226826632331832083577158936441323%7CMCAAMLH-1608791198%7C6%7CMCAAMB-1608791198%7C6G1ynYcLPuiQxYZrsz_pkqfLG9yMXBpb2zX5dvJdYQJzPXImdj0y%7CMCOPTOUT-1608193599s%7CNONE%7CMCAID%7CNONE%7CMCSYNCSOP%7C411-18618%7CvVersion%7C5.1.1%7CMCCIDH%7C1956761501; OptanonConsent=isIABGlobal=false&datestamp=Thu+Dec+17+2020+01%3A26%3A42+GMT-0500+(Eastern+Standard+Time)&version=6.8.0&hosts=&consentId=725daed6-f572-4bb7-9858-72ecb8d8052a&interactionCount=1&landingPath=NotLandingPage&groups=1%3A1%2C2%3A1%2C3%3A1%2C4%3A1&AwaitingReconsent=false; s_nr=1608186483335-Repeat; API_CSRF_TOKEN=da3bdf26-0e12-414c-b5c4-db1c055777f9; ak_bmsc=CE1938E638B6ED97126FA8F7A48C4C231730FE35E1790000AA1EDC5FF416FD01~plR+O+spqoIZlI74C9vz8rwdSwyUgkVV/BLdXK11/Tbu2vlCR9rOEZRv81iyNxvApS1KuF6gsD/OV3q9eI6ivqIFTP7XkoFt/K5LGSjIqGr+mXW3naGndARA8Fpv6agr/bDbdbdmXMkrlp6jyHIE1W+qdbHol/g/K14fAqT/Zy2uP+DJxPOiObfZgKyZIQuL2uvevrB1kwtnWK1t2OzeDDHfOxLBcsLbk2wauGdvLVXlMjjw714D1KeQUyBOpigCQ9; bm_sv=C4B5098C294BC2F405DC0B9402C3007F~PIBt1udoaybsJgCSe7A3/PW1gncNyMAIf7w8RM+t1oD8H7D9yRwUeZhS4/UFeIxkgUhobmYNLL662CwxQfbuDYJstEfHPGxVesWnu+V32GPUKcaApht/eaZlvaKLlWRlZW79civPlG3VpaA2tM6+qA=="),

)













)

rstudioapi::addTheme(fs::path_home(".config/rstudio/themes/rscodeio.rstheme"))
rstudioapi::applyTheme("rscodeio")

jsonlite::write_json(
  jsonlite::fromJSON(
    txt = '
  {
    "restore_source_documents": false,
    "console_double_click_select": true,
    "full_project_path_in_window_title": true,
    "save_workspace": "never",
    "load_workspace": false,
    "remove_history_duplicates": true,
    "restore_last_project": false,
    "soft_wrap_r_files": true,
    "highlight_selected_line": true,
    "show_invisibles": true,
    "show_indent_guides": true,
    "syntax_color_console": true,
    "scroll_past_end_of_document": true,
    "auto_append_newline": true,
    "strip_trailing_whitespace": true,
    "show_help_tooltip_on_idle": true,
    "tab_multiline_completion": true,
    "code_completion_characters": 1,
    "style_diagnostics": true,
    "windows_terminal_shell": "win-git-bash",
    "editor_theme": "rscodeio",
    "show_rmd_render_command": true,
    "use_tinytex": true,
    "jobs_tab_visibility": "shown",
    "highlight_r_function_calls": true
}'),
  path = fs::path_home("dotfiles", "rstudio", "rstudio-prefs.json")
)

dict <- rstudioapi::dictionariesPath()
