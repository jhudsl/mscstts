testthat::context("Regions match Website")
testthat::test_that("Check regions are equal to ms_regions", {
  testthat::skip_on_cran()

  if (requireNamespace("rvest", quietly = TRUE) &&
      requireNamespace("xml2", quietly = TRUE)) {
    doc = xml2::read_html(paste0("https://docs.microsoft.com/en-us/azure/",
                           "cognitive-services/speech-service/regions"))
    tab = rvest::html_table(doc)
    regions = sapply(tab, function(x) {
      if ("Region identifier" %in% colnames(x)) {
        return(unlist(x[, "Region identifier"]))
      }
      return(NULL)
    })
    regions = sort(unique(unlist(regions)))
    testthat::expect_true(all(ms_regions() %in% regions))
  }

})
