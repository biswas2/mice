#'Print a \code{mids} object
#'
#'@rdname print
#'@param x Object of class \code{mids}, \code{mira} or \code{mipo}
#'@param ... Other parameters passed down to \code{print.default()}
#'@return \code{NULL}
#'@seealso \code{\link[=mids-class]{mids}}
#'@method print mids
#'@export
print.mids <- function(x, ...) {
  cat("Class: mids\n")
  cat("Number of multiple imputations: ", x$m, "\n")
  cat("Imputation methods:\n")
  print(x$method, ...)
  cat("PredictorMatrix:\n")
  print(head(x$predictorMatrix), ...)
  invisible(x)
}

#'Print a \code{mira} object
#'
#'@rdname print
#'@return \code{NULL}
#'@seealso \code{\link[=mira-class]{mira}}
#'@method print mira
#'@export
print.mira <- function(x, ...) {
  m <- ifelse(is.null(x$analyses), length(x), length(x$analyses))
  cat("Class: mira       m:", m, "\n")
  cc <- as.character(getCall(getfit(x, 1)))
  cat("Complete-data model:", cc[1], "    formula:", cc[2])
  invisible(x)
} 

#'Print a \code{mipo} object
#'
#'@rdname print
#'@return \code{NULL}
#'@seealso \code{\link[=mipo-class]{mipo}}
#'@method print mipo
#'@export
print.mipo <- function(x, ...) {
  cat("Class: mipo\n")
  z <- summary(x, ...)
  class(z) <- "data.frame"
  names <- c("estimate", "std.error", "statistic", "p.value")
  z <- z[, names]
  print(z, ...)
  invisible(x)
}

#'Print a \code{summary.mipo} object
#'
#'@rdname print
#'@return \code{NULL}
#'@seealso \code{\link[=mipo-class]{mipo}}
#'@method print mipo.summary
#'@export
print.mipo.summary <- function(x, ...) {
  print.data.frame(x, ...)
  invisible(x)
}


#'Print a \code{mice.anova} object
#'
#'@rdname print
#'@return \code{NULL}
#'@seealso \code{\link[=mipo-class]{mipo}}
#'@method print mice.anova
#'@export
print.mice.anova <- function(x, ...) {
  z <- summary(x, ...)
  print(z$comparisons, row.names = FALSE)
  invisible(x)
}

#'Print a \code{summary.mice.anova} object
#'
#'@rdname print
#'@return \code{NULL}
#'@seealso \code{\link[=mipo-class]{mipo}}
#'@method print mice.anova.summary
#'@export
print.mice.anova.summary <- function(x, ...) {
  cat("\nModels:\n")
  print(x$models, row.names = FALSE)
  cat("\nComparisons:\n")
  print(x$comparisons, row.names = FALSE)
  cat("\nNumber of imputations: ", x$m, 
      "  Method", x$method)
  if (x$method == "D2") cat(" (", x$use, ")", sep = "")
  cat("\n")
  invisible(x)
}


#
# --------------------------------PRINT.MADS--------------------------------------
#
#'Print a \code{mads} object
#'
#'@param x Object of class \code{mads}
#'@param ... Other parameters passed down to \code{print.default()}
#'@return \code{NULL}
#'@seealso \code{\link[=mads-class]{mads}}
#'@method print mads
#'@export
print.mads <- function(x, ...) {
  if (is.mads(x)) {
    cat("Multivariate Amputed Data Set")
    cat("\nCall: ")
    print(x$call)
    cat("Class:", class(x))
    cat("\nProportion of Missingness: ", x$prop)
    cat("\nFrequency of Patterns: ", x$freq)
    cat("\nPattern Matrix:\n")
    print(x$patterns)
    cat("Mechanism:")
    print(x$mech)
    cat("Weight Matrix:\n")
    print(x$weights)
    cat("Type Vector:\n")
    print(x$type)
    cat("Odds Matrix:\n")
    print(x$odds)
    cat("Head of Amputed Data Set\n")
    print(head(x$amp))
  } else print(x, ...)
  invisible()
}

