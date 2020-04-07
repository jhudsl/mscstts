## code to prepare `regions` dataset goes here
library(rvest)
library(xml2)

doc = read_html(paste0("https://docs.microsoft.com/en-us/azure/",
                       "cognitive-services/speech-service/regions"))
tab = html_table(doc)
regions = sapply(tab, function(x) {
  if ("Region identifier" %in% colnames(x)) {
    return(unlist(x[, "Region identifier"]))
  }
  return(NULL)
})
regions = sort(unique(unlist(regions)))
stopifnot(all(ms_regions() %in% regions))

