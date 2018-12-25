#' Print method for token
#'
#' @return NULL
#' @param x an object used to select a method.
#' @param ... further arguments passed to or from other methods
#' @param reveal Should the token be revealed
#' @export
#'
#' @examples
#' x = "asdf"
#' class(x) = "token"
#' print(x)
#' attr(x, "timestamp") = Sys.time()
#' print(x)
#'
#' print(x, reveal = TRUE)
#' @method print token
print.token = function(x, reveal = FALSE, ...) {
  ts = attr(x, "timestamp")
  if (!is.null(ts)) {
    cat(paste0("Token Retrieved at: ", ts, "\n"))
  }
  if (reveal) {
    print(as.character(x), ...)
  } else {
    cat("<hidden token>")
  }
  invisible(x)
}

#' @export
#' @rdname print.token
reveal = function(x, ...) {
  print(x, reveal = TRUE, ...)
}
