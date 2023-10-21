

sync_dir.rstudio.rstudio <- fs::path(tools::R_user_dir(package = "reserves", which = "data"), "RStudio-Backups")

find_rstudio_dirs.win <- function() {
  
  base_appdata_dir <- dirname(Sys.getenv("APPDATA"))
  
  local_appdata_dir <- fs::path(base_appdata_dir, "Local")
  local_low_appdata_dir <- fs::path(base_appdata_dir, "Local-Low")
  roaming_appdata_dir <- fs::path(base_appdata_dir, "Roaming")
  
  fs::path(base_appdata_dir) %>%
    fs::dir_ls(recurse = 1, type = "directory", regexp = "RStudio", fail = FALSE, ignore.case = TRUE) %>%
    fs::path_abs() %>%
    as.character()
  
}

find_rstudio_dirs.win()

select_backup_dirs.win <- function() {
  
  opts <- c(
    "Backup All Directories",
    find_rstudio_dirs.win()
  )
  
  hold <- utils::select.list(
    choices = opts,
    preselect = opts[1],
    multiple = TRUE,
    title = "Select which directories to backup:"
  )
  
  if (length(hold) == 1 && hold == opts[1]) return(opts[-1]) else out <- hold %>% setdiff(opts[1])
  
  return(out)
  
}

examine_dirs <- function(...) {
  
  fs::dir_info()
  
}

stash_dir <- function(path) {
  
  fs::dir_create(sync_dir.rstudio)
  
  to_dir <- fs::path(sync_dir.rstudio, basename(dirname(path)), basename(path))
  
  try(fs::dir_copy(path, to_dir, overwrite = TRUE))
  
  if (fs::dir_exists(to_dir)) {
    
    log_file <- fs::path(to_dir, "LOG.txt")
    path_file <- fs::path(to_dir, "PATH.txt")
    
    fs::file_create(log_file)
    fs::file_create(path_file)
    
    txt <- paste0(
      path, " successfully backed up to: ", to_dir
    )
    
    cat(utils::timestamp(stamp = date()), txt, "##--------------------------------------##\n\n", 
        sep = "\n", file = log_file, append = TRUE)
    
    cat(path, file = path_file)
    
    cli::cli_alert_success(text = txt)
    
  }
}

get_rstudio_prefs <- function() {
  
  dirs_ <- find_rstudio_dirs.win() %>%
    stringr::str_subset(pattern = "BACKUP", negate = TRUE)
  
  pref_file_rstudio <- 
    
    pref_file_desktop <- fs::dir_ls(dirs_, type = "file", regexp = "rstudio-prefs.json") 
  ini_file_desktop <- fs::dir_ls(dirs_, glob = "*.ini")
  
  
  
  # pref_dir <- dirs_[stringr::str_detect(dirs_, "RStudio-Desktop")] %>%
  # stringr::str_subset(pattern = "BACKUP", negate = TRUE)
  # <- fs::path(pref_dir, "rstudio-prefs.json")
  
  json_prefs <- jsonlite::read_json(pref_file_desktop)
  ini_prefs <- readr::read_lines(ini_file_desktop)
  # custom_dicts <- 
  # snippets <- 
  # keyboard <- 
  
}

dirs_ <- find_rstudio_dirs.win() %>%
  stringr::str_subset(pattern = "BACKUP", negate = TRUE)

dirs_ %>% purrr::walk(stash_dir)

backup_to_github <- function(public_ = TRUE) {
  
  gistr::gist_create(
    files = fs::dir_ls(sync_dir.rstudio, recurse=TRUE, type = "file"),
    description = "RStudio Settings Backups via reserver R Package.",
    public = public_
  )
  
  # gistr::gist_auth()
  gistr::gist_create_git(
    files = sync_dir.rstudio,
    description = "RStudio Settings Backups via reserver R Package.",
    public = public_
  )
  
}

get_ini_prefs <- function

get_rstudio_prefs()


'{
    "restore_source_documents": false,
    "auto_expand_error_tracebacks": true,
    "full_project_path_in_window_title": true,
    "save_workspace": "never",
    "load_workspace": false,
    "restore_last_project": false,
    "windows_terminal_shell": "win-git-bash",
    "editor_theme": "Cobalt",
    "jobs_tab_visibility": "shown"
}'
)

stash_dir(dirs[1])
