group_across <- function(x,group_vars,fun_list,value_vars=NULL,more_args_list=NULL){
  if(is.null(value_vars)) value_vars <- setdiff(names(x),group_vars)
  if(is.null(more_args_list)) more_args_list <- replicate(length(fun_list),list(),simplify = FALSE)
  if(is.null(names(more_args_list))){
    stopifnot(length(fun_list)==length(more_args_list))
  }else{
    stopifnot(!is.null(names(fun_list)))
    stopifnot(all(names(more_args_list)%in%names(fun_list)))
    stopifnot(sum(duplicated(names(fun_list)))==0L)
    stopifnot(sum(duplicated(names(more_args_list)))==0L)
    i <- match(names(more_args_list),names(fun_list))
    new_more_args_list <- replicate(length(fun_list),list(),simplify = FALSE)
    new_more_args_list[i] <- more_args_list
    more_args_list <- new_more_args_list
  }
  s <- split(x, x[, group_vars])
  names(s) <- NULL
  out <- lapply(s, function(z){ #z is a data.frame, subsetted to current group
    temp <- mapply(fun_list, more_args_list, SIMPLIFY = FALSE,
                   FUN=function(f,args){     #f is a function, args is a list of arguments
                     lapply(z[,value_vars,drop=FALSE],function(.z){ #.z is a column
                       do.call("f",c(list(.z),args))
                     })
                   })
    value.results <- unlist(temp, recursive = FALSE)
    c(z[1L,group_vars,drop=FALSE],value.results) #prepend grouping column
  })
  do.call("rbind.data.frame",c(out,list(make.row.names=FALSE)))
}

##group_across allows different functions to be passed different arguments whereas across does not.
#the downside, as seen below, is that if you want to pass the same argument to multiple functions it's more wordy than across.
group_across(mtcars, group_vars=c("cyl","am"),
             fun_list = list(mean=mean, sum=sum,sd=sd),
             more_args_list=list(mean=list(trim=.3)))





mtcars$wt <- c(2.62, 2.875, 2.32, 3.215, 3.44, 3.46, 3.57, 3.19, 3.15, 3.44,
               3.44, 4.07, 3.73, NA, 5.25, 5.424, 5.345, 2.2, 1.615, 1.835,
               2.465, 3.52, NA, 3.84, 3.845, 1.935, 2.14, 1.513, 3.17, 2.77,
               3.57, 2.78)



base <- group_across(mtcars, group_vars=c("cyl","am"),
                     fun_list = list(mean=mean, sum=sum,sd=sd),
                     more_args_list=list(sd=list(na.rm=TRUE),mean=list(na.rm=TRUE),sum=list(na.rm=TRUE)))


library(dplyr)
tidy <- mtcars %>%
  group_by(cyl,am) %>%
  summarize(across(.fns = list(mean=mean,sum=sum,sd=sd),.names = "{.fn}.{.col}",na.rm=TRUE)) %>%
  as.data.frame()

base <- base[order(base$cyl,base$am),names(tidy)]
row.names(tidy) <- NULL
row.names(base) <- NULL

identical(tidy, base)
