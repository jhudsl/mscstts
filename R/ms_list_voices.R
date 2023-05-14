#' Get a Full List of Voices for a specific region
#'
#' @param api_key Microsoft Cognitive Services API key, if token is not
#' provided.
#' @param token An authentication token, base-64 encoded usually from
#' \code{\link{ms_get_tts_token}}.  If not provided, will be created from
#' \code{\link{ms_get_tts_token}}
#' @param region Subscription region for your key.
#' See \url{https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/overview}
#' @param ... Additional arguments to send to \code{\link{GET}}
#'
#' @return A \code{data.frame} of the names and their long names.
#' @examples \dontrun{
#' if (ms_have_tts_key()) {
#' res = ms_list_voices()
#' }
#'
#' }
#'
#' \dontrun{
#' res = ms_list_voices(region = "eastus")
#' }
#' @export
ms_list_voices = function(
  api_key = NULL,
  token = NULL,
  region = NULL,
  ...
){

  region = ms_region(region)
  synth_url = paste0("https://", region,
               ".tts.speech.microsoft.com/",
               "cognitiveservices/voices/list")
  if (is.null(token)) {
    token = ms_get_tts_token(api_key = api_key,
                             region = region)$token
  }

  # Create a request
  req <- httr2::request(synth_url)

  # Specify HTTP headers
  req <- req %>%
    httr2::req_headers(
      `Host` = paste0(region, ".", "api.cognitive.microsoft.com"),
      `Ocp-Apim-Subscription-Key` = api_key)

  # Perform a request and fetch the response
  resp <- req %>%
    httr2::req_perform()

  # Extract JSON
  resp_json = httr2::resp_body_json(resp)
  # TODO: Reformat list into dataframes

  return(out)
}
