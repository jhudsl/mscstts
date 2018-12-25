
#' Get Microsoft Text To Speech (TTS) or Cognitive
#' Services Token from API Key
#'
#' @param api_key Microsoft Cognitive Services API key, if token is not
#' provided.
#' @param script A character vector of lines to be spoken
#' @param token An authentication token, base-64 encoded usually from
#' \code{\link{ms_get_tts_token}}.  If not provided, will be created from
#' \code{\link{ms_get_tts_token}}
#' @param gender Sex of the Speaker
#' @param language Language to be spoken,
#' must be from \code{\link{ms_language_codes}}
#' @param output_format Format of the output, see
#' \url{https://docs.microsoft.com/en-us/azure/cognitive-services/speech/api-reference-rest/bingvoiceoutput}
#' for more information
#' @param escape Should non-standard characters be substituted?  Should not
#' be used if \code{script} has SSML tags. See \code{\link{ms_create_ssml}}
#' @param ... Additional arguments to send to \code{\link{POST}}
#'
#' @return A list of the request, content, token, and `SSML`.
#' @note The
#' content is likely in a binary format and the output depends on the
#' `output_format` chosen.  For example, if the `output_format` is an `MP3`,
#' then see below example
#'
#' @examples \dontrun{
#' if (ms_have_tts_key()) {
#' res = ms_synthesize(
#' script = "hey, how are you doing? I'm doing pretty good",
#' output_format = "audio-16khz-128kbitrate-mono-mp3")
#' tmp <- tempfile(fileext = ".mp3")
#' writeBin(res$content, con = tmp)
#' mp3 = tuneR::readMP3(tmp)
#' }
#'
#' }
#' @export
#' @importFrom httr POST add_headers stop_for_status content content_type
ms_synthesize = function(
  script,
  token = NULL,
  api_key = NULL,
  gender = c("Female", "Male"),
  language = "en-US",
  output_format = c( "raw-16khz-16bit-mono-pcm" ,
                     "ssml-16khz-16bit-mono-tts",
                     "audio-16khz-16kbps-mono-siren",
                     "riff-16khz-16kbps-mono-siren",
                     "riff-16khz-16bit-mono-pcm",
                     "audio-16khz-128kbitrate-mono-mp3",
                     "audio-16khz-64kbitrate-mono-mp3",
                     "audio-16khz-32kbitrate-mono-mp3"),
  escape = FALSE,
  region = NULL,
  api = c("tts", "bing"),
  ...
){

  L = ms_validate_language_gender(
    language = language,
    gender = gender)
  language = L$language
  gender = L$gender
  xname = L$full_name


  synth_url = ms_synthesize_api_url(
    api = api,
    region = region
  )

  if (is.null(token)) {
    token = ms_get_tts_token(api_key = api_key)$token
  }

  auth_hdr = add_headers(
    "Authorization" = token)
  output_format = match.arg(output_format)

  fmt_hdr = add_headers(
    "X-Microsoft-OutputFormat" = output_format)

  ctype = content_type("application/ssml+xml")

  ssml = ms_create_ssml(script = script, gender = gender, language = language,
                        escape = escape)

  if (nchar(ssml) > 1024) {
    cat(ssml)
    stop("Need smaller script! SSML is over 1024 characters")
  }
  res = POST(synth_url,
             body = ssml,
             auth_hdr, fmt_hdr, ctype, auth_hdr,
             ...)
  stop_for_status(res)
  out = content(res)
  class(token) = "token"

  L = list(
    request = res,
    ssml = ssml,
    content = out,
    token = token)
  return(L)
}


#' @rdname ms_synthesize
#' @param region Subscription region for your key.
#' See \url{https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/rest-apis#text-to-speech}
#'
#' @export
ms_region = function(region = ms_regions()) {
  if (missing(region)) {
    region = getOption("ms_region")
  }
  region = match.arg(region)
  return(region)
}

#' @rdname ms_synthesize
#' @export
#' @examples
#' ms_regions()
ms_regions = function() {
  c("westus", "eastasia", "northeurope",
    "westus2",
    "eastus",
    "eastus2",
    "southeastasia",
    "westeurope")
}

#' @rdname ms_synthesize
#' @export
ms_set_region = function(
  region = ms_regions()) {
  region = match.arg(region)
  options(ms_region = region)
  return(region)
}



#' @rdname ms_synthesize
#' @param api which API to authorize on, either
#' \code{tts} for text to speech or \code{bing} for
#' Bing text to speech API
#' @export
ms_synthesize_api_url = function(
  api = c("tts", "bing"),
  region = NULL
){
  api = match.arg(api)

  region = ms_region(region)
  synth_url = switch(
    api,
    bing = paste0(
      'https://speech.platform.bing.com/',
      'synthesize'),
    tts = paste0("https://", region,
                 ".tts.speech.microsoft.com/",
                 "cognitiveservices/v1")
  )
  return(synth_url)
}
