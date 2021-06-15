## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(individual)
library(mockery)

# Utility function for printing out C++ code
lang_output <- function(x, lang) {
  cat(c(sprintf("```%s", lang), x, "```"), sep = "\n")
}
cpp_output <- function(x) lang_output(x, "cpp")
print_cpp_file <- function(path) cpp_output(readLines(path))

## -----------------------------------------------------------------------------
render_state_sizes <- function(api) {
  api$render('susceptible_counts', length(api$get_state(human, S)))
  api$render('infected_counts', length(api$get_state(human, I)))
  api$render('recovered_counts', length(api$get_state(human, R)))
}

## -----------------------------------------------------------------------------
human <- mockery::mock()
S <- mockery::mock()
I <- mockery::mock()
R <- mockery::mock()

api <- list(
  get_state = mockery::mock( # create a function which
    seq(10), #returns 1:10 on the first call
    seq(5) + 10, #returns 11:15 on the second call, and
    seq(2) + 15 #returns 16:18 on the third call
  ),
  render = mockery::mock()
)

render_state_sizes(api)

mockery::expect_called(api$get_state, 3) #get_state is called three times
mockery::expect_args(api$get_state, 1, human, S) #the first time for the S state
mockery::expect_args(api$get_state, 2, human, I) #then for the I state
mockery::expect_args(api$get_state, 3, human, R) #then for the R state

mockery::expect_called(api$render, 3) #render is called three times
mockery::expect_args(api$render, 1, 'susceptible_counts', 10) #the first time for the S state
mockery::expect_args(api$render, 2, 'infected_counts', 5) #then for the I state
mockery::expect_args(api$render, 3, 'recovered_counts', 2) #then for the R state

## ----echo = FALSE, results="asis"---------------------------------------------
print_cpp_file(
  system.file('testcpp/src/code.h', package = 'individual', mustWork = TRUE)
)

## ----echo = FALSE, results="asis"---------------------------------------------
print_cpp_file(
  system.file('testcpp/src/test-example.cpp', package = 'individual', mustWork = TRUE)
)

## -----------------------------------------------------------------------------
temp_lib <- tempdir(check = FALSE)

# Install test package
install.packages(
  system.file('testcpp', package = 'individual', mustWork = TRUE),
  repos = NULL,
  type = 'source',
  lib = temp_lib
)

# load test package
library('testcpp', lib.loc = temp_lib)

# run the test
testthat::test_file(
  system.file(
    'testcpp/tests/testthat/test-cpp.R',
    package = 'individual',
    mustWork = TRUE
  )
)

