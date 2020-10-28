# mscstts 0.6.2

* Skipping test that was failing on CRAN.

# mscstts 0.6.0

* Removed parts of the test that need to be done live.
* Need to add in Neural voices if possible.
* Fixed URL redirect in DESCRIPTION.

# mscstts 0.5.6

* Fixed bug in simplified Chinese capitalization.

# mscstts 0.5.4

* Fixed bug in Catalan (Spain) vs. Catalan.

# mscstts 0.5.3

* Updated fix for test after https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/language-support changed.

# mscstts 0.5.3

* Updated tests and locales.
* Added passthrough for `regions` for tokens.

# mscstts 0.5.1

* Added voice listing.
* Added new output formats for audio that should be correct.

# mscstts 0.5.0

* Added `ms_regions` to allow for the region for tokens.
* Now supports TTS proper, not really Bing. 

# mscstts 0.4.0

* Added `reveal` code for tokens.
* Added `validate_language_gender`.

# mscstts 0.3.0

* Refactoring some code.
* Allow for escaping in SSML.
* Separated validation code for language and gender combinations.

# mscstts 0.2.2

* CRAN submission.

# mscstts 0.1.0

* Added a `NEWS.md` file to track changes to the package.

* First release, `ms_synthesize` is the main function.
