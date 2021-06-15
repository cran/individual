## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo=FALSE--------------------------------------------------------
library(individual)

## ----conditional_block, eval=!pkgdown::in_pkgdown(),echo=F--------------------
knitr::asis_output(
"## Table of Contents {#toc}

  1. [Introduction](#intro)
  2. [Bitset](#bitset)
  3. [Prefabs](#prefab)
  4. [C++ Prefabs](#cpp_prefab)"
)

## ----eval=FALSE---------------------------------------------------------------
#  recovery_process <- function(t){
#    I <- health$get_index_of("I")
#    already_scheduled <- recovery_event$get_scheduled()
#    I$and(already_scheduled$not())
#    rec_times <- rgeom(n = I$size(),prob = pexp(q = gamma * dt)) + 1
#    recovery_event$schedule(target = I,delay = rec_times)
#  }

## ----eval=FALSE---------------------------------------------------------------
#  infection_process <- function(t){
#    I <- health$get_size_of("I")
#    foi <- beta * I/N
#    S <- health$get_index_of("S")
#    S$sample(rate = pexp(q = foi * dt))
#    health$queue_update(value = "I",index = S)
#  }

## ----eval=FALSE---------------------------------------------------------------
#  n <- 1e4
#  bset <- Bitset$new(n)$insert(1:n)
#  probs <- runif(n)
#  
#  keep <- probs >= 0.5
#  
#  stay <- filter_bitset(bitset = bset,other = which(keep))
#  leave <- filter_bitset(bitset = bset,other = which(!keep))

## ----eval=FALSE---------------------------------------------------------------
#  stay <- bset$copy()
#  stay$sample(rate = probs)
#  
#  leave <- bset$copy()$set_difference(stay)

## ----eval=FALSE---------------------------------------------------------------
#  processes <- list(
#    multi_probability_bernoulli_process_cpp(state, "I", "R", prob),
#    other_process_1,
#    other_process_2
#  )

