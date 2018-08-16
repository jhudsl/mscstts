#' Language and Gender to Microsoft Voice Name
#'
#' @param language A language code, see \code{\link{ms_language_codes}}
#' @param gender Either Male or Female, not all languages support both genders
#'
#' @return A character string of the name of the voice
#' @export
#'
#' @examples
#' language_to_ms_name()
#' validate_language_gender()
language_to_ms_name = function(
  language =  "en-US",
  gender = c("Female", "Male")) {

  L = validate_language_gender(
    language = language,
    gender = gender)
  xname = L$full_name
  return(xname)
}

#' @rdname language_to_ms_name
#' @export
validate_language_gender = function(
  language =  "en-US",
  gender = c("Female", "Male")) {
  locales = ms_locales()
  n_locales = names(locales)
  stopifnot(length(language) == 1)
  if (!(language %in% n_locales)) {
    stop(paste0("Lanuage ", language, " not in locales"))
  }
  locales = locales[[language]]
  n_locales = names(locales)
  gender = match.arg(gender)
  stopifnot(length(gender) == 1)
  if (!(gender %in% n_locales)) {
    stop(paste0("Gender ", gender, " not in locales for this language"))
  }
  xname = locales[[gender]]
  return(list(language = language, gender = gender,
              full_name = xname))
}
