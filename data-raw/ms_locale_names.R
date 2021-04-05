## code to prepare `DATASET` dataset goes here

library(dplyr)
library(rvest)
library(xml2)
url = paste0(
  "https://docs.microsoft.com/en-us/azure/cognitive-services/",
  "speech-service/language-support")
doc = xml2::read_html(url)
tab = rvest::html_table(doc)
# standard voices not neural
index = sapply(tab, function(x) {
  if (!"Voice name" %in% colnames(x)) {
    return(FALSE)
  }
  x = x[, "Voice name", drop = TRUE]
  !any(grepl("Neural", x))
})
index = which(index)
tab = tab[[index]]
colnames(tab) = trimws(sub("(BCP-47)", "", colnames(tab), fixed = TRUE))
tab = tab %>%
  select(code = Locale, language= Language) %>%
  distinct() %>%
  mutate(language = sub(" \\)", ")", language))

ms_locale_names = tab

usethis::use_data(ms_locale_names, overwrite = TRUE)
