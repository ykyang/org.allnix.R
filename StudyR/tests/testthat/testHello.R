test_that("bye",{
  expect_equal(bye(),"Bye!")
})

test_that("vector", {
  x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
  expect_equal(x[2], 5.6)

  # - function: assign - #
  assign("y", c(10.4, 5.6, 3.1, 6.4, 21.7))
  expect_equal(y[1], 10.4)

  # - concatnate - #
  y <- c(x, 0, x)
  expect_equal(y[6], 0)
  expect_equal(y[11], 21.7)

  # - vector operator - #
  x <- c(1,2,3)
  y <- c(2,4,6)
  z <- 2*x + y + 1
  expect_equal(z[1], 5)

  # - range - #
  w <- range(x)
  expect_equal(w[1], 1)
  expect_equal(w[2], 3)

  # - length - #
  expect_equal(length(x), 3)
  # - sum - #
  expect_equal(sum(x), 6)
  # - product - #
  expect_equal(prod(x), 6)

  # --- Sequence --- #
  x <- 1:5
  expect_equal(x[5], 5)
  x <- 5:1
  expect_equal(x[1], 5)
  x <- 2*(1:5)
  expect_equal(x[5],10)
  x <- 2*1:5 # high precedence in : operator
  expect_equal(x[5],10)
  x <- seq(from=1, to=10, by=2)
  expect_equal(x[5], 9)
  expect_true(is.na(x[6])) # subscript out of bound???
  #expect_equal(x[6], NA_real_) # subscript out of bound???
  x <- seq(from=1, by=2, length=5)
  expect_equal(x[5], 9)

  x <- seq(1,5)
  y <- seq(6, along = x)
  expect_equal(length(y), length(x))
  expect_equal(y[5], 10)

  y <- rep(x, times=2) # 1,2,3,4,5, 1,2,3,4,5
  expect_equal(length(y), 2*length(x))
  expect_equal(y[9], 4)

  y <- rep(x, each=2) # 1,1, 2,2, 3,3, 4,4, 5,5
  expect_equal(length(y), 2*length(x))
  expect_equal(y[9], 5)

  # - NaN - #
  expect_true(is.nan(0/0))
  expect_true(is.na(0/0))

  # - Filter an array - #
  x <- c(1, 0/0, 3)
  y <- x[!is.na(x)]
  expect_equal(y, c(1, 3))

  # : x, y, y, x,  x, y, y, x
  x <- c("x", "y")[rep(c(1,2,2,1), times=2)]
  expect_equal(x[1], x[8])

  # - Exclude index - #
  x <- c(1:5)
  y <- x[-(1:4)] #: exclude 1 to 4
  expect_equal(length(y), 1)
  expect_equal(y[1], 5)

  # - TODO: names: Have no idea how this works - #
  fruit <- seq(10,30, by=10)
  names(fruit) <- c("apple", "orange", "peach")
})
