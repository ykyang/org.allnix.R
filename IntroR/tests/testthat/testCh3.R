test_that("mode and length",{
  # - shorten the length - #
  x <- 1:10
  expect_equal(length(x), 10)
  length(x) <- 1
  expect_equal(length(x), 1)

  # - Zero length and mode - #
  x <- character(0)
  expect_equal(length(x), 0)
  expect_equal(mode(x), "character")

  # - changes of mode: as.*()
  # - a.k.a. casting
  x <- as.character(1:10) #: x is now characters
  expect_equal(x[10], "10")
  x <- as.integer(x) #: x is now integers
  expect_equal(x[10], 10)
})
