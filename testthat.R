ans = require("testthat")

test_that("Loading testthat", {
  #ans = require("testthat")
  expect_true(ans)
})

# Clean up
rm(list=ls())

