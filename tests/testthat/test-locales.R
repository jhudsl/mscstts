testthat::context("Regions match Website for locales")
testthat::test_that("Check locales are equal to ms_locales", {

  if (requireNamespace("rvest", quietly = TRUE) &&
      requireNamespace("xml2", quietly = TRUE)) {

    url = paste0("https://docs.microsoft.com/en-us/azure/cognitive-services/",
                 "speech-service/language-support")
    doc = xml2::read_html(url)
    tab = rvest::html_table(doc)
    index = sapply(tab, function(x) {
      if (!"Full service name mapping" %in% colnames(x)) {
        return(FALSE)
      }
      x = x[, "Full service name mapping", drop = TRUE]
      !any(grepl("Neural", x))
    })
    index = which(index)
    tab = tab[[index]]

    sub_tab = tab[, c("Locale", "Language")]
    sub_tab$Locale = gsub("[*]", "",     sub_tab$Locale)
    sub_tab = unique(sub_tab)
    sub_tab = sub_tab[!(sub_tab$Locale == "" & sub_tab$Language == ""),]
    cn = colnames(sub_tab)
    cn[ cn == "Locale"] = "code"
    cn[ cn == "Language"] = "language"
    colnames(sub_tab) = cn
    df = ms_locale_df()

    testthat::expect_equal(sort(unique(sub_tab$language)),
                           sort(unique(df$language)))
  }
})
