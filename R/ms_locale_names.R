#' Names of Microsoft Locales
#'
#' @format A \code{data.frame} with 2 columns:
#' \describe{
#' \item{code}{the 5 character language code, separated by a hyphen, also referred to as a locale}
#' \item{language}{the name of the language}
#' }
"ms_locale_names"


#' Detailed Names of Microsoft Locales and Voices
#'
#' @format A \code{data.frame} with 2 columns:
#' \describe{
#' \item{locale}{full name with \code{Microsoft Server Speech Text to Speech Voice} in there}
#' \item{display_name}{short display name}
#' \item{local_name}{local name}
#' \item{short_name}{shorter than locale name, but has language code as well}
#' \item{gender}{gender of the voice}
#' \item{code}{the 5 character language code, separated by a hyphen, also referred to as a locale}
#' \item{sample_rate}{sample rate (in Hz) of the voice}
#' \item{voice_type}{Standard or Neural}
#' }
"ms_locales_df"

