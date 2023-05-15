#' Convert Language and Gender to Microsoft Voice Name
#'
#' @param language A language code, see \code{\link{ms_language_codes}}
#' @param gender Either Male or Female, not all languages support both genders
#'
#' @return A character string of the name of the voice
#' @export
#'
#' @examples
#' ms_language_to_ms_name()
#' ms_validate_language_gender()
ms_language_to_ms_name = function(
  language =  "en-US",
  gender = c("Female", "Male")) {

  L = ms_validate_language_gender(
    language = language,
    gender = gender)
  xname = L$full_name
  xname = xname[1]
  return(xname)
}


#' Validate whether a specified language and gender combination is supported
#'
#' @param language A language code, see \code{\link{ms_language_codes}}
#' @param gender Either Male or Female, not all languages support both genders
#'
#' @export
ms_validate_language_gender = function(language =  "en-US",
                                       gender = c("Female", "Male")) {
  locales = ms_locales()
  n_locales = names(locales)
  stopifnot(length(language) == 1)
  if (!(language %in% n_locales)) {
    stop(paste0("Lanuage ", language, " not in locales"))
  }
  locales = locales[[language]]
  n_locales = names(locales)
  gender = tolower(gender)
  gender = match.arg(gender, choices = c("female", "male"))
  stopifnot(length(gender) == 1)
  gender = paste0(toupper(substr(gender, 1, 1)), substr(gender, 2, nchar(gender)))
  gender = match.arg(gender, choices = c("Female", "Male"))
  if (!(gender %in% n_locales)) {
    stop(paste0("Gender ", gender, " not in locales for this language"))
  }
  xname = locales[[gender]]
  return(list(language = language, gender = gender,
              full_name = xname))
}
