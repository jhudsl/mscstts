testthat::test_that(desc = "Create SSML properly with given parameters", {

  testthat::expect_equal(
    mscstts::ms_create_ssml("created with default voice"),
    "<speak version='1.0' xml:lang='en-US'><voice xml:lang='en-US' xml:gender='Female' name='Microsoft Server Speech Text to Speech Voice (en-US, AriaRUS)'>created with default voice</voice></speak>")
  testthat::expect_error(
    mscstts::ms_create_ssml("this is an error", voice = "invalid voice name"))
  testthat::expect_equal(
    mscstts::ms_create_ssml("created with given voice", voice = "Microsoft Server Speech Text to Speech Voice (zh-CN, Yaoyao)"),
    "<speak version='1.0' xml:lang='zh-CN'><voice xml:lang='zh-CN' xml:gender='Female' name='Microsoft Server Speech Text to Speech Voice (zh-CN, Yaoyao)'>created with given voice</voice></speak>")
  testthat::expect_equal(
    mscstts::ms_create_ssml("created with given voice in short name", voice = "vi-VN-An"),
    "<speak version='1.0' xml:lang='vi-VN'><voice xml:lang='vi-VN' xml:gender='Male' name='Microsoft Server Speech Text to Speech Voice (vi-VN, An)'>created with given voice in short name</voice></speak>")
})

