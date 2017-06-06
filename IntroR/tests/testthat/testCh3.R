test_that("length",{
  x <- 1:10
  expect_equal(length(x), 10)
  # - shorten the length - #
  length(x) <- 1
  expect_equal(length(x), 1)
})
