library(rvest)
library(dplyr)
library(mscstts)
url = "https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/language-support"
doc = xml2::read_html(url)
tab = rvest::html_table(doc)
tab = tab[[3]]

sub_tab = tab %>%
  select(Locale, Language)
sub_tab = sub_tab %>%
  mutate(Locale = gsub("[*]", "", Locale)) %>%
  distinct %>%
  filter(!(Locale == "" & Language == "")) %>%
  rename(code = Locale, language = Language)
df = ms_locale_df()
setdiff(sub_tab$language, unique(df$language))
setdiff(unique(df$language),sub_tab$language)

tab = tab %>%
  mutate(
    Language = ifelse(Language == "", NA, Language),
    Language = zoo::na.locf(Language, na.rm = FALSE),
    Locale = ifelse(Locale == "", NA, Locale),
    Locale = zoo::na.locf(Locale, na.rm = FALSE))
