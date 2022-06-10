testthat::context("Regions match Website for locales")
testthat::test_that("Check locales are equal to ms_locales", {
  testthat::skip_on_cran()
  if (requireNamespace("rvest", quietly = TRUE) &&
      requireNamespace("xml2", quietly = TRUE)) {

    url = paste0("https://docs.microsoft.com/en-us/azure/cognitive-services/",
                 "speech-service/language-support")
    doc = xml2::read_html(url)
    tab = rvest::html_table(doc)
    # standard voices not neural
    index = sapply(tab, function(x) {
      if (!"Voice name" %in% colnames(x)) {
        return(NA_character_)
      }
      x = x[, "Voice name", drop = TRUE]
      ifelse(any(grepl("Neural", x)), "neural", "regular")
    })
    keep = which(index %in% "regular")
    if (length(keep) == 0) {
      keep = which(index %in% "neural")
    }
    index = keep
    tab = tab[index]
    tab = lapply(tab, function(x) {
      colnames(x) = sub("(BCP-47)", "", colnames(x), fixed = TRUE)
      cn = colnames(x)
      if (!all(c("Locale", "Language") %in% cn)) {
        return(NULL)
      }
      x[, c("Locale", "Language")]
    })
    tab = do.call(rbind, tab)
    colnames(tab) = sub("(BCP-47)", "", colnames(tab), fixed = TRUE)
    colnames(tab) = trimws(colnames(tab))

    Encoding(tab$Locale) = "UTF-8"
    Encoding(tab$Language) = "UTF-8"

    sub_tab = tab[, c("Locale", "Language")]
    sub_tab$Locale = gsub("[*]", "",     sub_tab$Locale)
    sub_tab$Language = gsub(" \\)", ")",   sub_tab$Language)
    sub_tab = unique(sub_tab)
    sub_tab = sub_tab[!(sub_tab$Locale == "" & sub_tab$Language == ""),]
    cn = colnames(sub_tab)
    cn[ cn == "Locale"] = "code"
    cn[ cn == "Language"] = "language"
    colnames(sub_tab) = cn
    df = mscstts::ms_locale_df()
    sub_tab$language = sub("Ã¥", "å", sub_tab$language)

    tab_lang = sort(unique(sub_tab$language))
    df_lang = sort(unique(df$language))
    testthat::expect_equal(tab_lang, df_lang)
  }
})
