#' Locales for Microsoft Translate
#'
#' @return A list of Locales and the Speech Voices
#' @export
#'
#' @importFrom jsonlite fromJSON
#' @examples
#' ms_locales()
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
    split(x$locale, x$Gender)
  })
  locales
}

#' @rdname ms_locales
#' @export
ms_locale_df = function() {
  # res = ms_locales()
  # res = unlist(res)
  # res = data.frame(locale = res, x = names(res),
  #                  stringsAsFactors = FALSE)
  # rownames(res) = NULL
  # ss = strsplit(res$x, split = "[.]")
  # res$code = sapply(ss, function(x) x[1])
  # res$Gender = sapply(ss, function(x) x[2])
  # res$x = NULL
  res = jsonlite::fromJSON(
    '[
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (ar-EG, Hoda)",
    "ShortName": "ar-EG-Hoda",
    "Gender": "Female",
    "Locale": "ar-EG"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (ar-SA, Naayf)",
    "ShortName": "ar-SA-Naayf",
    "Gender": "Male",
    "Locale": "ar-SA"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (bg-BG, Ivan)",
    "ShortName": "bg-BG-Ivan",
    "Gender": "Male",
    "Locale": "bg-BG"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (ca-ES, HerenaRUS)",
    "ShortName": "ca-ES-HerenaRUS",
    "Gender": "Female",
    "Locale": "ca-ES"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (cs-CZ, Jakub)",
    "ShortName": "cs-CZ-Jakub",
    "Gender": "Male",
    "Locale": "cs-CZ"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (da-DK, HelleRUS)",
    "ShortName": "da-DK-HelleRUS",
    "Gender": "Female",
    "Locale": "da-DK"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (de-AT, Michael)",
    "ShortName": "de-AT-Michael",
    "Gender": "Male",
    "Locale": "de-AT"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (de-CH, Karsten)",
    "ShortName": "de-CH-Karsten",
    "Gender": "Male",
    "Locale": "de-CH"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (de-DE, Hedda)",
    "ShortName": "de-DE-Hedda",
    "Gender": "Female",
    "Locale": "de-DE"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (de-DE, HeddaRUS)",
    "ShortName": "de-DE-HeddaRUS",
    "Gender": "Female",
    "Locale": "de-DE"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (de-DE, Stefan, Apollo)",
    "ShortName": "de-DE-Stefan-Apollo",
    "Gender": "Male",
    "Locale": "de-DE"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (el-GR, Stefanos)",
    "ShortName": "el-GR-Stefanos",
    "Gender": "Male",
    "Locale": "el-GR"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (en-AU, Catherine)",
    "ShortName": "en-AU-Catherine",
    "Gender": "Female",
    "Locale": "en-AU"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (en-AU, HayleyRUS)",
    "ShortName": "en-AU-HayleyRUS",
    "Gender": "Female",
    "Locale": "en-AU"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (en-CA, Linda)",
    "ShortName": "en-CA-Linda",
    "Gender": "Female",
    "Locale": "en-CA"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (en-CA, HeatherRUS)",
    "ShortName": "en-CA-HeatherRUS",
    "Gender": "Female",
    "Locale": "en-CA"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (en-GB, George, Apollo)",
    "ShortName": "en-GB-George-Apollo",
    "Gender": "Male",
    "Locale": "en-GB"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (en-GB, HazelRUS)",
    "ShortName": "en-GB-HazelRUS",
    "Gender": "Female",
    "Locale": "en-GB"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (en-GB, Susan, Apollo)",
    "ShortName": "en-GB-Susan-Apollo",
    "Gender": "Female",
    "Locale": "en-GB"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (en-IE, Sean)",
    "ShortName": "en-IE-Sean",
    "Gender": "Male",
    "Locale": "en-IE"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (en-IN, Heera, Apollo)",
    "ShortName": "en-IN-Heera-Apollo",
    "Gender": "Female",
    "Locale": "en-IN"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (en-IN, PriyaRUS)",
    "ShortName": "en-IN-PriyaRUS",
    "Gender": "Female",
    "Locale": "en-IN"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (en-IN, Ravi, Apollo)",
    "ShortName": "en-IN-Ravi-Apollo",
    "Gender": "Male",
    "Locale": "en-IN"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (en-US, BenjaminRUS)",
    "ShortName": "en-US-BenjaminRUS",
    "Gender": "Male",
    "Locale": "en-US"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (en-US, Guy24kRUS)",
    "ShortName": "en-US-Guy24kRUS",
    "Gender": "Male",
    "Locale": "en-US"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (en-US, JessaRUS)",
    "ShortName": "en-US-JessaRUS",
    "Gender": "Female",
    "Locale": "en-US"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (en-US, Jessa24kRUS)",
    "ShortName": "en-US-Jessa24kRUS",
    "Gender": "Female",
    "Locale": "en-US"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (en-US, ZiraRUS)",
    "ShortName": "en-US-ZiraRUS",
    "Gender": "Female",
    "Locale": "en-US"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (es-ES, HelenaRUS)",
    "ShortName": "es-ES-HelenaRUS",
    "Gender": "Female",
    "Locale": "es-ES"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (es-ES, Laura, Apollo)",
    "ShortName": "es-ES-Laura-Apollo",
    "Gender": "Female",
    "Locale": "es-ES"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (es-ES, Pablo, Apollo)",
    "ShortName": "es-ES-Pablo-Apollo",
    "Gender": "Male",
    "Locale": "es-ES"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (es-MX, HildaRUS)",
    "ShortName": "es-MX-HildaRUS",
    "Gender": "Female",
    "Locale": "es-MX"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (es-MX, Raul, Apollo)",
    "ShortName": "es-MX-Raul-Apollo",
    "Gender": "Male",
    "Locale": "es-MX"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (fi-FI, HeidiRUS)",
    "ShortName": "fi-FI-HeidiRUS",
    "Gender": "Female",
    "Locale": "fi-FI"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (fr-CA, Caroline)",
    "ShortName": "fr-CA-Caroline",
    "Gender": "Female",
    "Locale": "fr-CA"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (fr-CA, HarmonieRUS)",
    "ShortName": "fr-CA-HarmonieRUS",
    "Gender": "Female",
    "Locale": "fr-CA"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (fr-CH, Guillaume)",
    "ShortName": "fr-CH-Guillaume",
    "Gender": "Male",
    "Locale": "fr-CH"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (fr-FR, HortenseRUS)",
    "ShortName": "fr-FR-HortenseRUS",
    "Gender": "Female",
    "Locale": "fr-FR"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (fr-FR, Julie, Apollo)",
    "ShortName": "fr-FR-Julie-Apollo",
    "Gender": "Female",
    "Locale": "fr-FR"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (fr-FR, Paul, Apollo)",
    "ShortName": "fr-FR-Paul-Apollo",
    "Gender": "Male",
    "Locale": "fr-FR"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (he-IL, Asaf)",
    "ShortName": "he-IL-Asaf",
    "Gender": "Male",
    "Locale": "he-IL"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (hi-IN, Hemant)",
    "ShortName": "hi-IN-Hemant",
    "Gender": "Male",
    "Locale": "hi-IN"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (hi-IN, Kalpana, Apollo)",
    "ShortName": "hi-IN-Kalpana-Apollo",
    "Gender": "Female",
    "Locale": "hi-IN"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (hi-IN, Kalpana)",
    "ShortName": "hi-IN-Kalpana",
    "Gender": "Female",
    "Locale": "hi-IN"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (hr-HR, Matej)",
    "ShortName": "hr-HR-Matej",
    "Gender": "Male",
    "Locale": "hr-HR"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (hu-HU, Szabolcs)",
    "ShortName": "hu-HU-Szabolcs",
    "Gender": "Male",
    "Locale": "hu-HU"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (id-ID, Andika)",
    "ShortName": "id-ID-Andika",
    "Gender": "Male",
    "Locale": "id-ID"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (it-IT, Cosimo, Apollo)",
    "ShortName": "it-IT-Cosimo-Apollo",
    "Gender": "Male",
    "Locale": "it-IT"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (it-IT, LuciaRUS)",
    "ShortName": "it-IT-LuciaRUS",
    "Gender": "Female",
    "Locale": "it-IT"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (ja-JP, Ayumi, Apollo)",
    "ShortName": "ja-JP-Ayumi-Apollo",
    "Gender": "Female",
    "Locale": "ja-JP"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (ja-JP, HarukaRUS)",
    "ShortName": "ja-JP-HarukaRUS",
    "Gender": "Female",
    "Locale": "ja-JP"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (ja-JP, Ichiro, Apollo)",
    "ShortName": "ja-JP-Ichiro-Apollo",
    "Gender": "Male",
    "Locale": "ja-JP"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (ko-KR, HeamiRUS)",
    "ShortName": "ko-KR-HeamiRUS",
    "Gender": "Female",
    "Locale": "ko-KR"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (ms-MY, Rizwan)",
    "ShortName": "ms-MY-Rizwan",
    "Gender": "Male",
    "Locale": "ms-MY"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (nb-NO, HuldaRUS)",
    "ShortName": "nb-NO-HuldaRUS",
    "Gender": "Female",
    "Locale": "nb-NO"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (nl-NL, HannaRUS)",
    "ShortName": "nl-NL-HannaRUS",
    "Gender": "Female",
    "Locale": "nl-NL"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (pl-PL, PaulinaRUS)",
    "ShortName": "pl-PL-PaulinaRUS",
    "Gender": "Female",
    "Locale": "pl-PL"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (pt-BR, HeloisaRUS)",
    "ShortName": "pt-BR-HeloisaRUS",
    "Gender": "Female",
    "Locale": "pt-BR"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (pt-BR, Daniel, Apollo)",
    "ShortName": "pt-BR-Daniel-Apollo",
    "Gender": "Male",
    "Locale": "pt-BR"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (pt-PT, HeliaRUS)",
    "ShortName": "pt-PT-HeliaRUS",
    "Gender": "Female",
    "Locale": "pt-PT"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (ro-RO, Andrei)",
    "ShortName": "ro-RO-Andrei",
    "Gender": "Male",
    "Locale": "ro-RO"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (ru-RU, EkaterinaRUS)",
    "ShortName": "ru-RU-EkaterinaRUS",
    "Gender": "Female",
    "Locale": "ru-RU"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (ru-RU, Irina, Apollo)",
    "ShortName": "ru-RU-Irina-Apollo",
    "Gender": "Female",
    "Locale": "ru-RU"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (ru-RU, Pavel, Apollo)",
    "ShortName": "ru-RU-Pavel-Apollo",
    "Gender": "Male",
    "Locale": "ru-RU"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (sk-SK, Filip)",
    "ShortName": "sk-SK-Filip",
    "Gender": "Male",
    "Locale": "sk-SK"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (sl-SI, Lado)",
    "ShortName": "sl-SI-Lado",
    "Gender": "Male",
    "Locale": "sl-SI"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (sv-SE, HedvigRUS)",
    "ShortName": "sv-SE-HedvigRUS",
    "Gender": "Female",
    "Locale": "sv-SE"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (ta-IN, Valluvar)",
    "ShortName": "ta-IN-Valluvar",
    "Gender": "Male",
    "Locale": "ta-IN"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (te-IN, Chitra)",
    "ShortName": "te-IN-Chitra",
    "Gender": "Female",
    "Locale": "te-IN"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (th-TH, Pattara)",
    "ShortName": "th-TH-Pattara",
    "Gender": "Male",
    "Locale": "th-TH"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (tr-TR, SedaRUS)",
    "ShortName": "tr-TR-SedaRUS",
    "Gender": "Female",
    "Locale": "tr-TR"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (vi-VN, An)",
    "ShortName": "vi-VN-An",
    "Gender": "Male",
    "Locale": "vi-VN"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (zh-CN, HuihuiRUS)",
    "ShortName": "zh-CN-HuihuiRUS",
    "Gender": "Female",
    "Locale": "zh-CN"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (zh-CN, Kangkang, Apollo)",
    "ShortName": "zh-CN-Kangkang-Apollo",
    "Gender": "Male",
    "Locale": "zh-CN"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (zh-CN, Yaoyao, Apollo)",
    "ShortName": "zh-CN-Yaoyao-Apollo",
    "Gender": "Female",
    "Locale": "zh-CN"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (zh-HK, Tracy, Apollo)",
    "ShortName": "zh-HK-Tracy-Apollo",
    "Gender": "Female",
    "Locale": "zh-HK"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (zh-HK, TracyRUS)",
    "ShortName": "zh-HK-TracyRUS",
    "Gender": "Female",
    "Locale": "zh-HK"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (zh-HK, Danny, Apollo)",
    "ShortName": "zh-HK-Danny-Apollo",
    "Gender": "Male",
    "Locale": "zh-HK"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (zh-TW, HanHanRUS)",
    "ShortName": "zh-TW-HanHanRUS",
    "Gender": "Female",
    "Locale": "zh-TW"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (zh-TW, Yating, Apollo)",
    "ShortName": "zh-TW-Yating-Apollo",
    "Gender": "Female",
    "Locale": "zh-TW"
  },
  {
    "Name": "Microsoft Server Speech Text to Speech Voice (zh-TW, Zhiwei, Apollo)",
    "ShortName": "zh-TW-Zhiwei-Apollo",
    "Gender": "Male",
    "Locale": "zh-TW"
  }
]'
  )

  cn = colnames(res)
  cn[ cn == "Locale"] = "code"
  cn[ cn == "ShortName"] = "short_name"
  cn[ cn == "Name"] = "locale"
  colnames(res) = cn


  # df = structure(
  #   list(code = c("ar-EG", "ca-ES", "da-DK", "de-DE", "en-AU",
  #                 "en-CA", "en-GB", "en-IN", "en-NZ", "en-US", "es-ES", "es-MX",
  #                 "fi-FI", "fr-CA", "fr-FR", "hi-IN", "it-IT", "ja-JP", "ko-KR",
  #                 "nb-NO", "nl-NL", "pl-PL", "pt-BR", "pt-PT", "ru-RU", "sv-SE",
  #                 "zh-CN", "zh-HK", "zh-TW"),
  #        language = c("Arabic (Egypt), modern standard",
  #                     "Catalan (Spain)", "Danish (Denmark)", "German (Germany)", "English (Australia)",
  #                     "English (Canada)", "English (United Kingdom)", "English (India)",
  #                     "English (New Zealand)", "English (United States)", "Spanish (Spain)",
  #                     "Spanish (Mexico)", "Finnish (Finland)", "French (Canada)", "French (France)",
  #                     "Hindi (India)", "Italian (Italy)", "Japanese (Japan)", "Korean (Korea)",
  #                     "Norwegian (Bokmal) (Norway)", "Dutch (Netherlands)", "Polish (Poland)",
  #                     "Portuguese (Brazil)", "Portuguese (Portugal)", "Russian (Russia)",
  #                     "Swedish (Sweden)", "Chinese (Mandarin, simplified)", "Chinese (Hong Kong SAR)",
  #                     "Chinese (Mandarin, Taiwanese)")), .Names = c("code", "language"
  #                     ), row.names = c(NA, 29L), class = "data.frame")
  df = structure(list(
    code = c("ar-EG", "ar-SA", "bg-BG", "ca-ES", "cs-CZ",
             "da-DK", "de-AT", "de-CH", "de-DE", "el-GR", "en-AU", "en-CA",
             "en-GB", "en-IE", "en-IN", "en-US", "es-ES", "es-MX", "fi-FI",
             "fr-CA", "fr-CH", "fr-FR", "he-IL", "hi-IN", "hr-HR", "hu-HU",
             "id-ID", "it-IT", "ja-JP", "ko-KR", "ms-MY", "nb-NO", "nl-NL",
             "pl-PL", "pt-BR", "pt-PT", "ro-RO", "ru-RU", "sk-SK", "sl-SI",
             "sv-SE", "ta-IN", "te-IN", "th-TH", "tr-TR", "vi-VN", "zh-CN",
             "zh-HK", "zh-TW"),
    language = c("Arabic (Egypt)", "Arabic (Saudi Arabia)",
                 "Bulgarian", "Catalan (Spain)", "Czech", "Danish", "German (Austria)",
                 "German (Switzerland)", "German (Germany)", "Greek", "English (Australia)",
                 "English (Canada)", "English (UK)", "English (Ireland)", "English (India)",
                 "English (US)", "Spanish (Spain)", "Spanish (Mexico)", "Finnish",
                 "French (Canada)", "French (Switzerland)", "French (France)",
                 "Hebrew (Israel)", "Hindi (India)", "Croatian", "Hungarian",
                 "Indonesian", "Italian", "Japanese", "Korean", "Malay", "Norwegian",
                 "Dutch", "Polish", "Portuguese (Brazil)", "Portuguese (Portugal)",
                 "Romanian", "Russian", "Slovak", "Slovenian", "Swedish", "Tamil (India)",
                 "Telugu (India)", "Thai", "Turkish", "Vietnamese", "Chinese (Mainland)",
                 "Chinese (Hong Kong)", "Chinese (Taiwan)")),
    row.names = c(NA,
                  -49L),
    class = "data.frame")

  res = merge(res, df, by = "code", all.x = TRUE, sort = FALSE)
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

