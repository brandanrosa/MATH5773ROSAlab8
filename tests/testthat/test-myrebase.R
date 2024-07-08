test_that("myrebase retuns df with rebased factors", {
  expect_type(myrebase(epoxy, 2, 60), type = "list")
})
