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
  2. [Variables](#var)
      1. [Categorical Variables](#cat_var)
      2. [Integer Variables](#int_var)
      3. [Double Variables](#dbl_var)
  3. [Processes](#proc)
      1. [Render](#rend)
  4. [Events](#event)
      1. [Targeted Events](#t_event)
  5. [Simulate](#sim)"
)

## ---- eval=FALSE--------------------------------------------------------------
#  bernoulli_process <- function(variable, from, to, rate) {
#    function(t) {
#      variable$queue_update(
#        to,
#        variable$get_index_of(from)$sample(rate)
#      )
#    }
#  }

## -----------------------------------------------------------------------------
bernoulli_process_time <- function(variable, int_variable, from, to, rate) {
  function(t) {
    to_move <- variable$get_index_of(from)$sample(rate)
    int_variable$queue_update(values = t, index = to_move)
    variable$queue_update(to, to_move)
  }
}

n <- 5e4
state <- CategoricalVariable$new(c('S', 'I'), rep('S', n))
time <- IntegerVariable$new(initial_values = rep(0, n))

proc <- bernoulli_process_time(variable = state,int_variable = time,from = 'S',to = 'I',rate = 0.1)

t <- 0
while (state$get_size_of('S') > 0) {
  proc(t = t)
  state$.update()
  time$.update()
  t <- t + 1
}

times <- time$get_values()
chisq.test(times, rgeom(n,prob = 0.1),simulate.p.value = T)

## ----eval=FALSE---------------------------------------------------------------
#  categorical_count_renderer_process <- function(renderer, variable, categories) {
#    function(t) {
#      for (c in categories) {
#        renderer$render(paste0(c, '_count'), variable$get_size_of(c), t)
#      }
#    }
#  }

## -----------------------------------------------------------------------------
recovery_event <- TargetedEvent$new(population_size = 100)
recovery_event$add_listener(function(timestep, target) {
  state$queue_update('R', target)
})

## ---- echo=FALSE, fig.cap="Simulation loop flowchart", out.width = "100%", fig.align='center'----
knitr::include_graphics("sim_loop.png")

## ---- class.source="bg-primary", class.output="bg-primary",eval=FALSE---------
#  simulation_loop <- function(
#    variables = list(),
#    events = list(),
#    processes = list(),
#    timesteps
#    ) {
#    if (timesteps <= 0) {
#      stop('End timestep must be > 0')
#    }
#    for (t in seq_len(timesteps)) {
#      for (process in processes) {
#        execute_any_process(process, t)
#      }
#      for (event in events) {
#        event$.process()
#      }
#      for (variable in variables) {
#        variable$.update()
#      }
#      for (event in events) {
#        event$.tick()
#      }
#    }
#  }

