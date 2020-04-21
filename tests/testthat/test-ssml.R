test_that(desc = "Create SSML properly with given parameters", {

  expect_equal(ms_create_ssml("created with default voice"),
               "<speak version='1.0' xml:lang='en-US'><voice xml:lang='en-US' xml:gender='Female' name='Microsoft Server Speech Text to Speech Voice (en-US, JessaRUS)'>created with default voice</voice></speak>")
  expect_error(ms_create_ssml("this is an error", voice = "invalid voice name"))
  expect_equal(ms_create_ssml("created with given voice", voice = "Microsoft Server Speech Text to Speech Voice (zh-CN, Yaoyao, Apollo)"),
               "<speak version='1.0' xml:lang='zh-CN'><voice xml:lang='zh-CN' xml:gender='Female' name='Microsoft Server Speech Text to Speech Voice (zh-CN, Yaoyao, Apollo)'>created with given voice</voice></speak>")
  expect_equal(ms_create_ssml("created with given voice in short name", voice = "vi-VN-An"),
               "<speak version='1.0' xml:lang='vi-VN'><voice xml:lang='vi-VN' xml:gender='Male' name='Microsoft Server Speech Text to Speech Voice (vi-VN, An)'>created with given voice in short name</voice></speak>")
})
