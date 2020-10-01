
[![Travis build
status](https://travis-ci.com/muschellij2/mscstts.svg?branch=master)](https://travis-ci.com/muschellij2/mscstts)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/muschellij2/mscstts?branch=master&svg=true)](https://ci.appveyor.com/project/muschellij2/mscstts)
<!-- README.md is generated from README.Rmd. Please edit that file -->

mscstts Package:
================

The goal of `mscstts` is to provide an R Client for the Microsoft
Cognitive Services Text to Speech REST API, including voice synthesis. A
valid account MUST be registered at the Microsoft Cognitive Services
website
<a href="https://azure.microsoft.com/en-us/services/cognitive-services/" class="uri">https://azure.microsoft.com/en-us/services/cognitive-services/</a>
in order to obtain a (free) API key. Without an API key, this package
will not work properly.

See the documentation here:
<a href="https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/overview" class="uri">https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/overview</a>

Getting an API key
------------------

You can get a TTS API key here:
<a href="https://azure.microsoft.com/en-us/try/cognitive-services/" class="uri">https://azure.microsoft.com/en-us/try/cognitive-services/</a>.
The API you need to get one from is Cognitive Services, Speech.

1.  Create an Azure account
2.  Go to
    <a href="https://portal.azure.com/#create/Microsoft.CognitiveServicesSpeechServices" class="uri">https://portal.azure.com/#create/Microsoft.CognitiveServicesSpeechServices</a>.
    If that works, skip to step 5.
3.  Go to
    <a href="https://portal.azure.com/#home" class="uri">https://portal.azure.com/#home</a>
4.  Click `+ Create a Resource`
5.  Search “Speech”
6.  Hit `+ Create`
7.  Should be able to create an F0 account (which is free - see below)
    if you hit the pricing tiers

<img src="man/figures/README-f0.png" width="382" />

### Setting up your API key

You can set up your API key in a number of ways (where `XXX` is your API
key):

1.  Edit `~/.Renviron` and set `MS_TTS_API_KEY = "XXXX"`
2.  In `R`, use `options(ms_tts_key = "XXXX")`.
3.  Set `export MS_TTS_API_KEY=XXXX` in `.bash_profile`/`.bashrc` if
    you’re using `R` in the terminal.
4.  Pass `api_key = "XXXX"` in arguments of functions such as
    `ms_list_voices(api_key = "XXXX")`.

Installation
------------

You can install `mscstts` from GitHub with:

    # install.packages("remotes")
    remotes::install_github("muschellij2/mscstts")

Example
-------

    library(mscstts)
    if (ms_have_tts_key()) {
      res = ms_synthesize(
        script = "hey, how are you doing? I'm doing pretty good",
        output_format = "audio-16khz-128kbitrate-mono-mp3")
      tmp <- tempfile("example", fileext = ".mp3")
      writeBin(res$content, con = tmp)
      mp3 = tuneR::readMP3(tmp)
    }
    testthat::expect_true(file.size(tmp) > 50000)
    if (interactive()) {
      tuneR::play(mp3, player = "play")
    }
