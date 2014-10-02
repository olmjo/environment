setvars <- function(.vars = list(),
                    .mode = "fallback",
                    .post = {}
                    ) {
    ## ##########
    ## Check Mode
    ## ##########

    stopifnot(.mode %in% c("fallback", "override"))
                                        #
                                        #

    ## #####
    ## Setup
    ## #####

    vNames <- names(.vars)
                                        # candidate vars
    vValues1 <- sapply(vNames,
                       function (X) Sys.getenv(X)
                       )
                                        # current env values
    vValues2 <- sapply(.vars,
                       as.character
                       )
                                        # coerce candidate values to char

    isEmpty <- nchar(vValues1) == 0
    toSet <- isEmpty | .mode == "override"

    ## print(toSet)

    ## #################
    ## Process Variables
    ## #################

    for (i in 1:length(vNames)) {
        if (toSet[i]) {
            tmp <- list()
            tmp[[vNames[[i]]]] <- vValues2[[i]]

            ## Set Env
            do.call("Sys.setenv",
                    tmp
                    )

            ## Assign R
            assign(x = vNames[i],
                   value = vValues2[[i]],
                   envir = .GlobalEnv
                   )
        } else{
            ## Push Env to R
            assign(x = vNames[i],
                   value = vValues1[[i]],
                   envir = .GlobalEnv
                   )
        }
    }

    ## ###################
    ## Post-Process Values
    ## ###################
    eval(.post, envir = .GlobalEnv)

    ## Returns
    invisible(NULL)
}
