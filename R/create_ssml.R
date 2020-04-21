#' Create SSML for Passing to Synthesize
#'
#' @param script A character vector of lines to be spoken
#' @param gender Sex of the Speaker
#' @param language Language to be spoken,
#' must be from \code{\link{ms_language_codes}}
#' @param escape Should non-standard characters be substituted?  Should not
#' be used if \code{script} has SSML tags
#' @param voice full voice name, usually from
#' \code{\link{ms_language_to_ms_name}}.  Will override
#' language and gender.
#' @return A character string of the text and SSML markup
#' @export
#'
#' @examples
#' ms_create_ssml("hey I really like things & dogs", escape = TRUE)
#' ms_create_ssml("hey I really like things")
#' ms_create_ssml('hey I <emphasis level="strong">really like</emphasis> things')
#' ms_create_ssml('hey I <emphasis level="strong">really like</emphasis> things',
#' escape = TRUE)
#'
ms_create_ssml = function(
  script,
  voice = NULL,
  gender = c("Female", "Male"),
  language = "en-US",
  escape = FALSE
){

  if (escape) {
    script = gsub("[<>/]", "", script)
    script = gsub("&", "and", script)
  }
  if (!is.null(voice)) {
    xname = ms_voice_info(voice)
    gender = xname$gender
    language = xname$language
    xname = xname$full_name[1]
  } else {
    xname = ms_language_to_ms_name(
      language = language,
      gender = gender)
  }

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

#' @rdname ms_create_ssml
#' @export
ms_voice_info = function(voice) {
  stopifnot(length(voice) == 1 & is.character(voice))
  df = ms_locale_df()
  keep = df$locale %in% voice | df$short_name %in% voice
  if (!any(keep)) {
    stop("Voice given is not a recognized voice! See ms_locale_df()")
  }
  df = df[ keep, , drop = FALSE]
  df = df[1, , drop = FALSE]
  L = list(gender = df$Gender,
           full_name = df$locale,
           language = df$code)
  return(L)
}
