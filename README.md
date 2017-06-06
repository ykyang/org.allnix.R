# README #

This README would normally document whatever steps are necessary to get your application up and running.

## Install Packages ##
Install basic R packages to facilitate the development process
```R
install.packages(c("devtools", "roxygen2", "testthat", "knitr"))
```
[R packages](http://r-pkgs.had.co.nz/intro.html)

## Creating a Package ##
See [R packages](http://r-pkgs.had.co.nz/package.html) for creating packages in
RStudio or using command line as following
```R
devtools::create("path/to/package/pkgname")
devtools::create("IntroR")
```
## Testing ##
Set up testing directory for `testthat`
```R
setwd("your/package/dir")
devtools::use_testthat()
```
Create testing R script in `your/package/dir/tests/testthat`.  The file name must
start with `test`.

For example create a file named `testCh3.R` in `.../tests/testthat`
```R
test_that("length",{
  x <- 1:10
  expect_equal(length(x), 10)
  # - shorten the length - #
  length(x) <- 1
  expect_equal(length(x), 1)
})
```
Run the test in RStudio with `ctrl-shift-t` or `devtools::test()` from CLI.


### What is this repository for? ###

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

* Summary of set up
* Configuration
* Dependencies
* Database configuration
* How to run tests
* Deployment instructions

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact
