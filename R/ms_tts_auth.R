#' @title Find API Key for Microsoft Text To Speech (TTS) or Cognitive
#' Services
#'
#' @description Determines if \code{option(ms_tts_key)} or
#' \code{option(ms_tts_key)} is set.
#' If not, it stops and returns an error.  If so, returns the value.
#' @param api_key Microsoft Cognitive Services API key
#' @param error Should the function error if \code{api_key = NULL}?
#' @note You can either set the API key using
#' \code{option(ms_tts_key)} or have it accessible by
#' \code{api_key = Sys.getenv('MS_TTS_API_KEY")}, or
#' \code{api_key = Sys.getenv('MS_TTS_API_KEY1")}, or
#' \code{api_key = Sys.getenv('MS_TTS_API_KEY2")}
#' @param region Subscription region for your key.
#' See
#' \url{https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/rest-apis#text-to-speech}
#' @return API key
#' @export
#' @examples
#' res = ms_get_tts_key(error = FALSE)
ms_get_tts_key = function(api_key = NULL, error = TRUE) {
  if (is.null(api_key)) {
    api_key = getOption("ms_tts_key")
  }
  get_key = function(x) {
    x = Sys.getenv(x)
    if (is.null(x)) {
      return(x)
    }
    if (x == "") {
      return(NULL)
    }
    return(x)
  }
  keys = c("MS_TTS_API_KEY",
           "MS_TTS_API_KEY1", "MS_TTS_API_KEY2")
  for (ikey in keys) {
    if (is.null(api_key)) {
      api_key = get_key(ikey)
    }
  }

  if (!is.null(api_key)) {
    if (api_key %in% "") {
      api_key = NULL
    }
  }

  if (is.null(api_key) & error) {
    stop(paste0("MS API key not found, please set ",
                "option('ms_tts_key') for general use or ",
                "set environment variable MS_TTS_API_KEY, to be ",
                "accessed by Sys.getenv('MS_TTS_API_KEY')"))
  }
  return(api_key)
}

#' @rdname ms_get_tts_key
#' @export
ms_have_tts_key = function(api_key = NULL) {
  api_key = ms_get_tts_key(api_key = api_key, error = FALSE)
  !is.null(api_key)
}


#' @rdname ms_get_tts_key
#' @export
ms_set_tts_key = function(api_key) {
  options("ms_tts_key" = api_key)
  invisible(NULL)
}


#' @rdname ms_get_tts_key
#' @export
ms_valid_tts_key = function(
  api_key = NULL,
  region = ms_regions()) {

  res = try({
    ms_get_tts_token(api_key = api_key,
                     region = region)
    })
  if (inherits(res, "try-error")) {
    return(FALSE)
  }
  res = res$request
  return(httr::status_code(res) < 400)
}

#' Get Microsoft Text To Speech (TTS) or Cognitive
#' Services Token from API Key
#'
#' @param api_key Microsoft Cognitive Services API key
#' @param region Subscription region for your key.
#' See
#' \url{https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/rest-apis#text-to-speech}
#' @return A list of the request, and token
#' @export
#' @importFrom httr POST add_headers stop_for_status content content_type
#'
#' @examples
#' if (ms_valid_tts_key()) {
#'    token = ms_get_tts_token()
#' }
ms_get_tts_token = function(
  api_key = NULL,
  region = ms_regions()) {

  token_url = ms_auth_url(region = region)

  api_key = ms_get_tts_key(api_key = api_key, error = TRUE)

  hdr = httr::add_headers('Ocp-Apim-Subscription-Key' =
                            api_key)
  res = httr::POST(token_url,
                   hdr,
                   # httr::content_type("application/x-www-form-urlencoded"))
                   httr::content_type("text/plain"))

  httr::stop_for_status(res)
  cr = httr::content(res)
  base64_token = rawToChar(cr)
  attr(base64_token, "timestamp") = Sys.time()
  class(base64_token) = "token"
  list(request = res,
       # content = cr,
       token = base64_token)
}

#' @rdname ms_get_tts_token
#' @export
ms_auth_url = function(
  region = ms_regions()) {
  if (!is.null(region)) {
    region = match.arg(region)
  } else {
    region = getOption("ms_region")
  }
  if (!is.null(region)) {
    region = paste0(region, ".")
  }
  token_url = paste0("https://", region, "api.cognitive.microsoft.com/",
                     "sts/v1.0/issueToken")
  return(token_url)
}

#' @rdname ms_get_tts_token
#' @param token An authentication of class \code{token},
#' likely from \code{\link{ms_get_tts_token}}
#' @export
ms_expired_token = function(token = NULL) {
  if (!inherits(token, "token")) {
    if (is.list(token)) {
      token = token$token
    }
  }
  ts = attr(token, "timestamp")
  if (is.null(ts)) {
    warning("Timestamp unknown for the token!  Please refresh")
    return(TRUE)
  }
  d = difftime(Sys.time(), ts, "mins")
  return(d >= 10)
}
