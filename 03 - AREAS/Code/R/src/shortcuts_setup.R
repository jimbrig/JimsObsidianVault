
#  ------------------------------------------------------------------------
#
# Title : setup shortcuts
#    By : Jimmy Briggs
#  Date : 2021-01-16
#
#  ------------------------------------------------------------------------

if (!require(shrtcts)) pak::pak("shrtcts")

library(shrtcts)

# create files ------------------------------------------------------------
fs::file_create(shortcuts_file)

# default locations are `~/.shrtcts.yml` ~/.config/.shrtcts.yml
# I like to use my global `~/.R/` to store all R configs so I change my path via
# options here:
shortcuts_file <- fs::path_home(".R", ".shrtcts.yml")

# adjust options to ensure know where to look for my shortcuts path
# add this option to .Rprofile
# add options(shrtcts.path = "C:/Users/Jimmy Briggs/.R/.shrtcts.yml") to .Rprofile

# restart to take into effect changes
usethis:::restart_rstudio()

# NOTES: can also use *.R instead of *.yml but I prefer YAML

# verify
locate_shortcuts_source(shortcuts_file, all = TRUE)
# C:/Users/Jimmy Briggs/.R/.shrtcts.yml

locate_addins_json(all = TRUE)

shrtcts::list_shortcuts()

# Install shortcuts -> add current Rstudio shortcuts
add_rstudio_shortcuts(
  path = shortcuts_file,
  set_keyboard_shortcuts = TRUE
)

usethis:::restart_rstudio

# verify added
shrtcts::list_shortcuts()

# addins.json
addins_path <- shrtcts::locate_addins_json()

file.edit(shortcuts_file)
# located current addins json files for rstudio
json_addins_path <- locate_addins_json()

# locate current shortcuts source path
locate_shortcuts_source()

shrtcts::add_rstudio_shortcuts(path = getOption("shrtcts.path"), set_keyboard_shortcuts = TRUE)
