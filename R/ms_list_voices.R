
#' List Voices
#'
#' @param api_key Microsoft Cognitive Services API key, if token is not
#' provided.
#' @param token An authentication token, base-64 encoded usually from
#' \code{\link{ms_get_tts_token}}.  If not provided, will be created from
#' \code{\link{ms_get_tts_token}}
#' @param region Subscription region for your key.
#' See \url{https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/rest-apis#text-to-speech}
#' @param ... Additional arguments to send to \code{\link{GET}}
#'
#' @return A \code{data.frame} of the names and their long names.
#' @examples \dontrun{
#' if (ms_have_tts_key()) {
#' res = ms_list_voices()
#' }
#'
#' }
#' @export
ms_list_voices = function(
  token = NULL,
  api_key = NULL,
  region = NULL,
  ...
){

  region = ms_region(region)
  synth_url = paste0("https://", region,
               ".tts.speech.microsoft.com/",
               "cognitiveservices/voices/list")
  if (is.null(token)) {
    token = ms_get_tts_token(api_key = api_key)$token
  }

  auth_hdr = httr::add_headers(
    "Authorization" = token)
  res = httr::GET(
    synth_url,
    auth_hdr,
    ...)

  httr::stop_for_status(res)
  out = httr::content(res, as = "text")
  out = jsonlite::fromJSON(out, flatten = TRUE)

  return(out)
}
