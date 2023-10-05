library(plumbpkg)
library(plumber)

controller <- system.file("plumber", "api1", "plumber.R", package = "plumbpkg")

r <- plumb(controller)
r$run(port = 8000, host = "0.0.0.0", swagger = TRUE)
