
#  ------------------------------------------------------------------------
#
# Title : PostgreSQL Functions
#    By : Jimmy Briggs
#  Date : 2021-02-01
#
#  ------------------------------------------------------------------------


# create database ---------------------------------------------------------

#' This function creates a new \code{PostgreSQL} database.
#'
#' \code{create_db} will create a new \code{PostgreSQL} database.
#'
#' @family postgresql functions
#'
#' @param dbname Name of database
#' @param port Default is 5432
#' @param user Default is 'postgres'
#' @param ... connection parameters passed to `createdb` (i.e. password, )
#'
#' @return user.
#'
#' @examples
#' create_database("columbiaBike", port=5432)
#'
#' @export
create_db <- function(dbname, port = 5432, user = "postgres") {

  #TODO, might want a test to see if DB exists
  #val<-"psql -U postgres -c \"select count(*) from pg_catalog.pg_database where datname = 'cehtp_pesticide'\""
  #system(val)

  system(paste("createdb -h localhost -p", port, "-U", user, dbname))

}


# *****************************************************************************
# Add empty tables ---------------------------
# *****************************************************************************

#' This function adds tables to a postgreSQL database.
#' @family postgresql functions
#' @param x A number.
#' @export
#' @param y A number.
#' @return The sum of \code{x} and \code{y}.
#' @examples
#' add_tables_db("columbiaBike", port=5432)
#'

add_tables_db<-function(dbname, port=5432, user="postgres"){

  #dbname<-"columbiaBike"
  #port<-5433
  sqlfile<-system.file("sql", "create_tables.sql", package = "sensorDataImport")
  runsql<-paste0('psql -p ', port, ' -U ', user,' -d ', dbname,' -a -f "', sqlfile, '"')
  system(runsql)

}


# *****************************************************************************
# Backup database ---------------------------
# *****************************************************************************

#' Backup database with pg_dump
#'
#' \code{backup_database} will backup the database as a compressed dump file or uncompressed SQL file.
#' @family postgresql functions
#' @param outpath_nosuffix is the full path and file name of the backup file to be generated with no suffix
#' automatically)
#' @param con is the name of the database connection
#' @param custom_compress is whether or not you want to use a custom-pre-compressed dump
#' format. If FALSE a standard SQL file is generated.
#' @return user.
#' @examples
#' backup_database("x:/junk", con=".connection", custom_compress=TRUE)
#' @export
backup_database<-function(outpath_nosuffix, con=".connection"){

  if(!valid_connection(con)){
    stop(paste(con, "is NOT valid database connection"))
  }


  con_info<-eval(as.name(con))$info


  system2("pg_dump", c("--username", con_info$user, "--port",
                       con_info$port, "--host", "localhost", "--dbname",
                       con_info$dbname),
          stdout = paste0(outpath_nosuffix, ".dump"))


}




# *****************************************************************************
# Restore database ---------------------------
# *****************************************************************************

#' Restore database with pg_restore
#'
#' \code{restore_database} will restore the database saved from the backup_database function.
#' @family postgresql functions
#' @param dump_path is the full path and file name for the dump file or SQL file
#' @param con is the name of the database connection
#' @param create_new if this is FALSE then it will create the database using the original DB name. So if the original
#' was columbiaBike it will create a new columbiaBike. If TRUE then it will create a new database with the name specificied
#' in new_db_name
#' @param new_db_name if creating a new db then this is the name of the new db
#' @return user.
#' @examples
#' restore_database("/Users/xyz/backup.dump", con=".connection", create_new = TRUE, new_db_name = "columbiaBike_backup")
#' @export
restore_database<-function(dump_path, con=".connection", create_new=TRUE, new_db_name = "newDB"){


  if(!valid_connection(con)){
    stop(paste(con, "is NOT valid database connection"))
  }

  if(!file.exists(outpath)){
    stop("No path by that name exists")
  }


  con_info<-eval(as.name(con))$info

  if(create_new){

    bash<-paste0("createdb --username=",
                 con_info$user,
                 " --port=",
                 con_info$port,
                 " ",
                 new_db_name)

    system(bash)
  }

  # create_new <- TRUE
  bash<-paste0("pg_restore --username=",
               con_info$user,
               " --port=",
               con_info$port,
               ifelse(create_new, "", " -C"),
               " -d ",
               ifelse(create_new, new_db_name, "postgres"), # postgres db just to issue the command
               " ",
               dump_path)

  # This works if columbiaBike is gone and you want to restore it
  # pg_restore --username=postgres --port=5432 -C -d postgres  /Users/zevross/junk/blah.dump

  # This works to create a new database with the same tables etc as the other one.
  #pg_restore --username=postgres --port=5432  -d mydb /Users/zevross/junk/blah.dump

  system(bash)


}




# *****************************************************************************
# Get database connection ---------------------------
# *****************************************************************************

#' This function creates the connection to a database
#' @family postgresql functions
#' @param dbname the database.
#' @param host database host, usually 'localhost'
#' @return .connection -- which is a global variable
#' @examples
#' get_connection(dbname="columbiaBike", host="localhost",
#' password="spatial", port=5433, user="postgres")
#' @export

get_connection<-function(dbname,
                         password,
                         host="localhost",
                         port=5432,
                         user="postgres"){


  # note the double arrow to make global
  .connection<<-try({dplyr::src_postgres(dbname=dbname,
                                         host=host,
                                         password=password,
                                         port=port,
                                         user=user)}, silent=TRUE)
}



# *****************************************************************************
# Test connection ---------------------------
# *****************************************************************************

#' This function creates the connection to a database
#' @family postgresql functions
#' @param dbname the database.
#' @param host database host, usually 'localhost'
#' @return .connection -- which is a global variable
#' @examples
#' get_connection(dbname="columbiaBike", host="localhost",
#' password="spatial", port=5433, user="postgres")
#' @export

valid_connection<-function(con = ".connection"){

  if(!exists(con) || is.error(eval(as.name(con)))){
    return(FALSE)
  }

  if(exists(con) & !is.error(eval(as.name(con)))){
    return(TRUE)
  }

}



# *****************************************************************************
# Test table existence ---------------------------
# *****************************************************************************

#' Test if table exists in DB.
#'
#'

#' @family postgresql functions
#' @param xxx
#' @param xxx
#' @return xxx
#' @examples xxx
#' @export
#'
table_exists<-function(tablename, con = ".connection"){

  if(!valid_connection(con)){
    stop(paste(con, "is NOT valid database connection"))
  }else{
    #tablename<-"gps"
    tst<-any(grepl(tablename, list_tables(con = con)))
    return(tst)

  }


}


# *****************************************************************************
# List tables ---------------------------
# *****************************************************************************

#' List tables in db.
#'
#'
#' \code{createDatabase} will create a new postgresql database.
#' @family postgresql functions
#' @param dbname Give the database a name.
#' @param port. You likely don't need to change this.
#' @return user.
#' @examples
#' create_database("columbiaBike", port=5432)
#' @export
#'
list_tables<-function(con = ".connection"){

  if(!valid_connection(con)){
    stop(paste(con, "is NOT valid database connection"))
  }else{

    con<-eval(as.name(con))
    tbls<-RPostgreSQL::dbListTables(con[["con"]])
    db<-con$info$dbname
    #message(paste("The tables in the", db, "database are:", paste(tbls, collapse=", ")))

    return(tbls)
  }


}









# *****************************************************************************
# List column names ---------------------------
# *****************************************************************************

#' Get the column names from a PostgreSQL table.
#'
#'
#' @family postgresql functions
#' @param tablename the postgresql table
#' @param con the postgresql connection
#' @return a vector of column names
#' @examples
#' create_database("columbiaBike", port=5432)
#'
#' @export
get_column_names<-function(tablename, con=".connection"){

  valcon<-valid_connection(con)
  tableexists<-table_exists(tablename)

  if(!valcon || !tableexists){
    stop(paste("Either you don't have a valid database connection or the table does not exist"))
  }else{

    q<-paste0("SELECT column_name, data_type FROM information_schema.columns
              WHERE table_schema = 'public' AND table_name   = '", tablename, "'")

    cols<-RPostgreSQL::dbGetQuery(.connection$con, q)
    return(cols)


  }

}



# *****************************************************************************
# Column exists ---------------------------
# *****************************************************************************

#' Does a column exist in the specified table.
#'
#'
#' @family postgresql functions
#' @param tablename the postgresql table
#' @param con the postgresql connection
#' @return a vector of column names
#' @examples
#' create_database("columbiaBike", port=5432)
#'
#' @export
column_exists<-function(tablename, column_names, con=".connection"){

  valcon<-valid_connection(con)
  tableexists<-table_exists(tablename)

  if(!valcon || !tableexists){
    stop(paste("Either you don't have a valid database connection or the table does not exist"))
  }else{

    res<-column_names%in%get_column_names(tablename)$column_name
    names(res)<-column_names

    return(res)


  }

}


# *****************************************************************************
# column types ---------------------------
# *****************************************************************************

#' What type is the column
#'
#'
#' @family postgresql functions
#' @param tablename the postgresql table
#' @param con the postgresql connection
#' @return a vector of column names
#' @examples
#' create_database("columbiaBike", port=5432)
#' @export
column_types<-function(tablename, column_names, con=".connection"){

  valcon<-valid_connection(con)
  tableexists<-table_exists(tablename)

  if(!valcon || !tableexists){
    stop(paste("Either you don't have a valid database connection or the table does not exist"))
  }else{

    res <- get_column_names(tablename)

    if(!all(column_names%in%res$column_name)){stop("One of the fields doesn't exist.")}

    mtch <- match(column_names, res$column_name)
    mtch <- mtch[!is.na(mtch)]

    res <- res[mtch,"data_type"]
    names(res)<-column_names


    return(res)


  }

}




# *****************************************************************************
# Upload table
# *****************************************************************************

#' This function is for uploading data to a postgres table
#'
#' @family postgresql functions
#' @param tablename the table name.
#' @param data the data to upload
#' @return user
#' @examples test
#' @export

upload_postgres<-function(tablename, data){
  rows<-nrow(data)
  writeLines(paste("About to upload", rows, "rows to" , tablename))


  postgresqlWriteTableAlt(.connection$con, tablename, data, append=TRUE, row.names=FALSE)

  msg<-paste("Completed upload of", rows, "rows to" , tablename)
  writeLines(msg)
  #kill_pg_connections()
}


# *****************************************************************************
# Get file names from a database
# *****************************************************************************

#' This function is for getting subject IDs from a table
#'
#' @family postgresql functions
#' @param tablename the table name.
#' @return user
#' @examples test
#' @export

get_subjectid<-function(tablename,  con=".connection"){

  valcon<-valid_connection(con)
  tableexists<-table_exists(tablename)

  #if not a valid connection of table does not exist
  if(!valcon || !tableexists){
    stop(paste("Either you don't have a valid database connection or the table does not exist"))

    #else a valid connection and table exist
  }else{


    q <- paste0("SELECT DISTINCT(subjectid) FROM ", tablename)
    res<-RPostgreSQL::dbGetQuery(.connection$con, q)

  }
  as.vector(t(res))
}


# *****************************************************************************
# Get file names from a database
# *****************************************************************************

#' This function is for getting the file names associated with a specific table
#'
#' @family postgresql functions
#' @param tablename the table name.
#' @param data the data to upload
#' @return user
#' @examples test
#' @export

get_filenames<-function(tablename,  con=".connection"){

  valcon<-valid_connection(con)
  tableexists<-table_exists(tablename)

  #if not a valid connection of table does not exist
  if(!valcon || !tableexists){
    stop(paste("Either you don't have a valid database connection or the table does not exist"))

    #else a valid connection and table exist
  }else{


    q <- paste0("SELECT DISTINCT(filename) FROM ", tablename)
    res<-RPostgreSQL::dbGetQuery(.connection$con, q)

  }
  as.vector(t(res))
}


# *****************************************************************************
# Get file names from a database
# *****************************************************************************

#' This function is for getting the file names associated with a specific table
#'
#' @family postgresql functions
#' @param tablename the table name.
#' @param data the data to upload
#' @return user
#' @examples test
#' @export

get_filenames_forSubject<-function(tablename, subjectid, con=".connection"){

  valcon<-valid_connection(con)
  tableexists<-table_exists(tablename)

  #if not a valid connection of table does not exist
  if(!valcon || !tableexists){

    stop(paste("Either you don't have a valid database connection or the table does not exist"))

    #else a valid connection and table exist
  }else if(!subjectid%in%get_subjectid(tablename)){

    stop(paste0("Rider ID ", subjectid, " does not exist in table ", tablename))

  }else{
    q <- paste0("SELECT DISTINCT(filename) FROM ", tablename, " WHERE subjectid='", subjectid, "'")
    res<-RPostgreSQL::dbGetQuery(.connection$con, q)

  }
  as.vector(t(res))
}




# *****************************************************************************
# Delete data ---------------------------
# *****************************************************************************

#' A function to delete data based on a filename
#'
#' @family postgresql functions
#' @param tablename
#' @param filename
#' @return user
#' @examples
#' #"BIKE0001_GPS01_S01_150306.gpx"
#' @export

delete_data<-function(tablename, filename, con=".connection"){

  valcon<-valid_connection(con)
  tableexists<-table_exists(tablename)

  #if not a valid connection of table does not exist
  if(!valcon || !tableexists){
    stop(paste("Either you don't have a valid database connection or the table does not exist"))

    #else a valid connection and table exist
  }else{

    # require the user to type in the file name -- this might be a pain and might not work
    # if the user wants to delete multiple files.
    test_filename<-readline("Please re-type the filename to\nconfirm deletion of all data with this filename:")

    # if the name typed and provided in the function are not the same
    if(!identical(test_filename, filename)){
      warning(paste0("The file names you provided are not the same.\nThe file name given was ", filename,
                     " and the file name typed was ", test_filename))


      # if the name typed and provided are the same
    }else{

      # if the filename is not in the database
      if(!already_uploaded(tablename, filename)){
        warning("This filename does not exist in the database - no rows deleted.")
      }

      nrow_before<-get_row_count(tablename)
      q<-paste0("DELETE FROM ", tablename, " WHERE filename = '", filename, "'")
      message(paste0("Proceeding with delete using the query:\n", q))
      res<-RPostgreSQL::dbGetQuery(.connection$con, q)

      nrow_after<-get_row_count(tablename)
      message(paste("Success: Table before had", nrow_before, "rows. Table now has", nrow_after, "rows"))

    }
  }

}

# *****************************************************************************
# Get row count ---------------------------
# *****************************************************************************

#' Get a row count from a table
#'
#' @family postgresql functions
#' @param tablename
#' @param filename
#' @return user
#' @examples
#' #"BIKE0001_GPS01_S01_150306.gpx"
#' @export

get_row_count<-function(tablename, con=".connection"){

  valcon<-valid_connection(con)
  tableexists<-table_exists(tablename)

  if(!valcon || !tableexists){
    stop(paste("Either you don't have a valid database connection or the table does not exist"))
  }else{

    q<-paste("SELECT COUNT(*) FROM", tablename)
    cnt<-RPostgreSQL::dbGetQuery(.connection$con, q)
    return(cnt)


  }

}



# *****************************************************************************
# Test for previous file upload ---------------------------
# *****************************************************************************

#' Tests if data has already been uploaded
#'
#' This function tests whether the filename exists in the given table
#' there is no check to see if the date or data are the same -- based only on
#' filename
#'
#' @family postgresql functions
#' @param dbname the database.
#' @param host database host, usually 'localhost'
#' @return .connection -- which is a global variable
#' @examples
#' try(already_uploaded("gps", "BIKE0001_GPS01_S01_150306.gpx"), silent=TRUE)
#' @export

already_uploaded<-function(tablename, filename, con=".connection"){

  valcon<-valid_connection(con)
  tableexists<-table_exists(tablename)

  if(!valcon || !tableexists){
    stop(paste("Either you don't have a valid database connection or the table does not exist"))
  }else{

    q<-paste0("SELECT exists (SELECT 1 FROM ", tablename, " WHERE filename = '", filename, "' LIMIT 1);")
    res<-RPostgreSQL::dbGetQuery(.connection$con, q)

    return(as.logical(res))

  }

}





# *****************************************************************************
# Load data ---------------------------
# *****************************************************************************

my_fun <- function(a, b) {
  if (!requireNamespace("pkg", quietly = TRUE)) {
    stop("Pkg needed for this function to work. Please install it.",
         call. = FALSE)
  }
}

# *****************************************************************************
# Kill connections ---------------------------
# *****************************************************************************

#' Tests if data has already been uploaded
#'
#' This function tests whether the filename exists in the given table
#' there is no check to see if the date or data are the same -- based only on
#' filename
#'
#' @family postgresql functions
#' @param dbname the database.
#' @param host database host, usually 'localhost'
#' @return Nothing
#' @examples
#' xyz
#' @export

kill_pg_connections <- function () {

  all_cons <- dbListConnections(PostgreSQL())


  for(con in all_cons)
    +  dbDisconnect(con)

  print(paste(length(all_cons), " connections killed."))

}
