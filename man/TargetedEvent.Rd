% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/targeted_event.R
\name{TargetedEvent}
\alias{TargetedEvent}
\title{TargetedEvent Class}
\description{
Describes a targeted event in the simulation.
This is useful for events which are triggered for a sub-population.
}
\section{Super class}{
\code{\link[individual:Event]{individual::Event}} -> \code{TargetedEvent}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-TargetedEvent-new}{\code{TargetedEvent$new()}}
\item \href{#method-TargetedEvent-schedule}{\code{TargetedEvent$schedule()}}
\item \href{#method-TargetedEvent-get_scheduled}{\code{TargetedEvent$get_scheduled()}}
\item \href{#method-TargetedEvent-clear_schedule}{\code{TargetedEvent$clear_schedule()}}
\item \href{#method-TargetedEvent-queue_extend}{\code{TargetedEvent$queue_extend()}}
\item \href{#method-TargetedEvent-queue_extend_with_schedule}{\code{TargetedEvent$queue_extend_with_schedule()}}
\item \href{#method-TargetedEvent-queue_shrink}{\code{TargetedEvent$queue_shrink()}}
\item \href{#method-TargetedEvent-.process_listener}{\code{TargetedEvent$.process_listener()}}
\item \href{#method-TargetedEvent-.process_listener_cpp}{\code{TargetedEvent$.process_listener_cpp()}}
\item \href{#method-TargetedEvent-.resize}{\code{TargetedEvent$.resize()}}
\item \href{#method-TargetedEvent-clone}{\code{TargetedEvent$clone()}}
}
}
\if{html}{\out{
<details open><summary>Inherited methods</summary>
<ul>
<li><span class="pkg-link" data-pkg="individual" data-topic="Event" data-id=".process"><a href='../../individual/html/Event.html#method-Event-.process'><code>individual::Event$.process()</code></a></li>
<li><span class="pkg-link" data-pkg="individual" data-topic="Event" data-id=".tick"><a href='../../individual/html/Event.html#method-Event-.tick'><code>individual::Event$.tick()</code></a></li>
<li><span class="pkg-link" data-pkg="individual" data-topic="Event" data-id="add_listener"><a href='../../individual/html/Event.html#method-Event-add_listener'><code>individual::Event$add_listener()</code></a></li>
</ul>
</details>
}}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-TargetedEvent-new"></a>}}
\if{latex}{\out{\hypertarget{method-TargetedEvent-new}{}}}
\subsection{Method \code{new()}}{
Initialise a TargetedEvent.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TargetedEvent$new(population_size)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{population_size}}{the size of the population.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-TargetedEvent-schedule"></a>}}
\if{latex}{\out{\hypertarget{method-TargetedEvent-schedule}{}}}
\subsection{Method \code{schedule()}}{
Schedule this event to occur in the future.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TargetedEvent$schedule(target, delay)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{target}}{the individuals to pass to the listener, this may be
either a vector of integers or a \code{\link[individual]{Bitset}}.}

\item{\code{delay}}{the number of time steps to wait before triggering the event,
can be a scalar in which case all targeted individuals are scheduled for
for the same delay or a vector of values giving the delay for that
individual.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-TargetedEvent-get_scheduled"></a>}}
\if{latex}{\out{\hypertarget{method-TargetedEvent-get_scheduled}{}}}
\subsection{Method \code{get_scheduled()}}{
Get the individuals who are scheduled as a \code{\link[individual]{Bitset}}.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TargetedEvent$get_scheduled()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-TargetedEvent-clear_schedule"></a>}}
\if{latex}{\out{\hypertarget{method-TargetedEvent-clear_schedule}{}}}
\subsection{Method \code{clear_schedule()}}{
Stop a future event from triggering for a subset of individuals.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TargetedEvent$clear_schedule(target)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{target}}{the individuals to clear, this may be either a vector of integers or
a \code{\link[individual]{Bitset}}.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-TargetedEvent-queue_extend"></a>}}
\if{latex}{\out{\hypertarget{method-TargetedEvent-queue_extend}{}}}
\subsection{Method \code{queue_extend()}}{
Extend the target size
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TargetedEvent$queue_extend(n)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{n}}{the number of new elements to add to the index}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-TargetedEvent-queue_extend_with_schedule"></a>}}
\if{latex}{\out{\hypertarget{method-TargetedEvent-queue_extend_with_schedule}{}}}
\subsection{Method \code{queue_extend_with_schedule()}}{
Extend the target size and schedule for the new population
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TargetedEvent$queue_extend_with_schedule(delays)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{delays}}{the delay for each new individual}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-TargetedEvent-queue_shrink"></a>}}
\if{latex}{\out{\hypertarget{method-TargetedEvent-queue_shrink}{}}}
\subsection{Method \code{queue_shrink()}}{
Shrink the targeted event
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TargetedEvent$queue_shrink(index)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{index}}{the individuals to remove from the event}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-TargetedEvent-.process_listener"></a>}}
\if{latex}{\out{\hypertarget{method-TargetedEvent-.process_listener}{}}}
\subsection{Method \code{.process_listener()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TargetedEvent$.process_listener(listener)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-TargetedEvent-.process_listener_cpp"></a>}}
\if{latex}{\out{\hypertarget{method-TargetedEvent-.process_listener_cpp}{}}}
\subsection{Method \code{.process_listener_cpp()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TargetedEvent$.process_listener_cpp(listener)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-TargetedEvent-.resize"></a>}}
\if{latex}{\out{\hypertarget{method-TargetedEvent-.resize}{}}}
\subsection{Method \code{.resize()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TargetedEvent$.resize()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-TargetedEvent-clone"></a>}}
\if{latex}{\out{\hypertarget{method-TargetedEvent-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TargetedEvent$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
