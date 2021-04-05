#' Locales for Microsoft Translate
#'
#' @return A list of Locales and the Speech Voices
#' @export
#'
#' @importFrom jsonlite fromJSON
#' @note This is generated from the JSON output of
#' \code{\link{ms_list_voices}}
#' @examples
#' ms_locales()
#' ms_locale_df()
ms_locales = function() {
  #   locales = jsonlite::fromJSON(
  #     '{
  #     "ar-EG": {"Female": "Microsoft Server Speech Text to Speech Voice (ar-EG, Hoda)"},
  #     "de-DE": {"Female": "Microsoft Server Speech Text to Speech Voice (de-DE, Hedda)",
  #     "Male": "Microsoft Server Speech Text to Speech Voice (de-DE, Stefan, Apollo)"},
  #     "en-AU": {"Female": "Microsoft Server Speech Text to Speech Voice (en-AU, Catherine)"},
  #     "en-CA": {"Female": "Microsoft Server Speech Text to Speech Voice (en-CA, Linda)"},
  #     "en-GB": {"Female": "Microsoft Server Speech Text to Speech Voice (en-GB, Susan, Apollo)",
  #     "Male": "Microsoft Server Speech Text to Speech Voice (en-GB, George, Apollo)"},
  #     "en-IN": {"Male": "Microsoft Server Speech Text to Speech Voice (en-IN, Ravi, Apollo)"},
  #     "en-US": {"Female": "Microsoft Server Speech Text to Speech Voice (en-US, ZiraRUS)",
  #     "Male": "Microsoft Server Speech Text to Speech Voice (en-US, BenjaminRUS)"},
  #     "es-ES": {"Female": "Microsoft Server Speech Text to Speech Voice (es-ES, Laura, Apollo)",
  #     "Male": "Microsoft Server Speech Text to Speech Voice (es-ES, Pablo, Apollo)"},
  #     "es-MX": {"Male": "Microsoft Server Speech Text to Speech Voice (es-MX, Raul, Apollo)"},
  #     "fr-CA": {"Female": "Microsoft Server Speech Text to Speech Voice (fr-CA, Caroline)"},
  #     "fr-FR": {"Female": "Microsoft Server Speech Text to Speech Voice (fr-FR, Julie, Apollo)",
  #     "Male": "Microsoft Server Speech Text to Speech Voice (fr-FR, Paul, Apollo)"},
  #     "it-IT": {"Male": "Microsoft Server Speech Text to Speech Voice (it-IT, Cosimo, Apollo)"},
  #     "ja-JP": {"Female": "Microsoft Server Speech Text to Speech Voice (ja-JP, Ayumi, Apollo)",
  #     "Male": "Microsoft Server Speech Text to Speech Voice (ja-JP, Ichiro, Apollo)"},
  #     "pt-BR": {"Male": "Microsoft Server Speech Text to Speech Voice (pt-BR, Daniel, Apollo)"},
  #     "ru-RU": {"Female": "Microsoft Server Speech Text to Speech Voice (pt-BR, Daniel, Apollo)",
  #     "Male": "Microsoft Server Speech Text to Speech Voice (ru-RU, Pavel, Apollo)"},
  #     "zh-CN": {"Female": "Microsoft Server Speech Text to Speech Voice (zh-CN, HuihuiRUS)",
  #     "Female2": "Microsoft Server Speech Text to Speech Voice (zh-CN, Yaoyao, Apollo)",
  #     "Male": "Microsoft Server Speech Text to Speech Voice (zh-CN, Kangkang, Apollo)"},
  #     "zh-HK": {"Female": "Microsoft Server Speech Text to Speech Voice (zh-HK, Tracy, Apollo)",
  #     "Male": "Microsoft Server Speech Text to Speech Voice (zh-HK, Danny, Apollo)"},
  #     "zh-TW": {"Female": "Microsoft Server Speech Text to Speech Voice (zh-TW, Yating, Apollo)",
  #     "Male": "Microsoft Server Speech Text to Speech Voice (zh-TW, Zhiwei, Apollo)"}
  # }')
  locales = ms_locale_df()
  locales = split(locales, locales$code)
  locales = lapply(locales, function(x) {
    split(x$locale, x$gender)
  })
  locales
}

#' @rdname ms_locales
#' @export
ms_locale_df = function() {
  # region = ms_region(NULL)
  # synth_url = paste0("https://", region,
  #                    ".tts.speech.microsoft.com/",
  #                    "cognitiveservices/voices/list")
  #   token = ms_get_tts_token(api_key = NULL,
  #                            region = region)$token
  #
  # auth_hdr = httr::add_headers(
  #   "Authorization" = token)
  # res = httr::GET(
  #   synth_url,
  #   auth_hdr)
  # cat(httr::content(res, as = "text"))


  res = mscstts::ms_locales_df
  res$index = 1:nrow(res)
  res = merge(res, mscstts::ms_locale_names, by = "code", all.x = TRUE, sort = FALSE)
  res = res[order(res$index),]
  return(res)
}

#' @rdname ms_locales
#' @export
ms_languages = function() {
  unique(ms_locale_df()$language)
}

#' @rdname ms_locales
#' @export
ms_language_codes = function() {
  unique(ms_locale_df()$code)
}

