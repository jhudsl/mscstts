#' Create SSML for Passing to Synthesize
#'
#' @param script A character vector of lines to be spoken
#' @param gender Sex of the Speaker
#' @param language Language to be spoken,
#' must be from \code{\link{ms_language_codes}}
#' @param escape Should non-standard chararacters be substituted?  Should not
#' be used if \code{script} has SSML tags
#'
#' @return A character string of the text and SSML markup
#' @export
#'
#' @examples
#' create_ssml("hey I really like things")
#' create_ssml('hey I <emphasis level="strong">really like</emphasis> things')
#' create_ssml('hey I <emphasis level="strong">really like</emphasis> things',
#' escape = TRUE)
create_ssml = function(
  script,
  gender = c("Female", "Male"),
  language = "en-US",
  escape = FALSE
){

  if (escape) {
    script = gsub("[<>/]", "", script)
    script = gsub("&", "and", script)
  }
  xname = language_to_ms_name(language = language, gender = gender)
  stopifnot(length(language) == 1)
  gender = match.arg(gender)
  stopifnot(length(gender) == 1)
  ssml = c(paste0(
    "<speak version='1.0' ", "xml:lang='",
    language, "'>"),
    paste0("<voice xml:lang='", language ,"'",
           " xml:gender='", gender, "'"),
    paste0(" name='", xname, "'"),
    ">",
    script, "</voice>",
    "</speak>")
  ssml = paste(ssml, collapse = "")
  return(ssml)
}
