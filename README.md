
[![Travis build
status](https://travis-ci.com/muschellij2/mscstts.svg?branch=master)](https://travis-ci.com/muschellij2/mscstts)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/muschellij2/mscstts?branch=master&svg=true)](https://ci.appveyor.com/project/muschellij2/mscstts)
[![Coverage
status](https://codecov.io/gh/muschellij2/mscstts/branch/master/graph/badge.svg)](https://codecov.io/github/muschellij2/mscstts?branch=master)
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mscstts Package:

The goal of `mscstts` is to provide an R Client for the Microsoft
Cognitive Services Text to Speech REST API, including voice synthesis. A
valid account MUST be registered at the Microsoft Cognitive Services
website <https://www.microsoft.com/cognitive-services/> in order to
obtain a (free) API key. Without an API key, this package will not work
properly.

See the documentation here:
<https://docs.microsoft.com/en-us/azure/cognitive-services/speech/home>

You can get a TTS API key here:
<https://azure.microsoft.com/en-us/try/cognitive-services/>. The API you
need to get one from is Bing Speech.

## Installation

You can install `mscstts` from GitHub with:

``` r
# install.packages("remotes")
remotes::install_github("muschellij2/mscstts")
```

## Example

``` r
library(mscstts)
if (have_ms_tts_key()) {
  res = ms_synthesize(
    script = "hey, how are you doing? I'm doing pretty good",
    output_format = "audio-16khz-128kbitrate-mono-mp3")
  tmp <- "example.mp3"
  writeBin(res$content, con = tmp)
  mp3 = tuneR::readMP3(tmp)
}
testthat::expect_true(file.size(tmp) > 50000)
if (interactive()) {
  tuner::play(mp3, player = "play")
}
```
