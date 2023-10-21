df_to_md <- function(df) {
    cn <- as.character(names(df))

    headr <- paste0(c("", cn), sep = "|", collapse = "")

    sepr <- paste0(
        c("|", rep(paste0(c(rep("-", 3), "|"), collapse = ""), length(cn))),
        collapse = ""
    )

    st <- "|"
    for (i in 1:nrow(df)) {
        for (j in 1:ncol(df)) {
            if (j %% ncol(df) == 0) {
                st <- paste0(
                    st,
                    as.character(df[i, j]), "|", "\n", "", "|",
                    collapse = ""
                )
            } else {
                st <- paste0(st, as.character(df[i, j]), "|", collapse = "")
            }
        }
    }

    fin <- paste0(c(headr, sepr, substr(st, 1, nchar(st) - 1)), collapse = "\n")

    cat(fin)
}
