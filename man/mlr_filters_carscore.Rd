% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FilterCarScore.R
\name{mlr_filters_carscore}
\alias{mlr_filters_carscore}
\alias{FilterCarScore}
\title{Conditional Mutual Information Based Feature Selection Filter}
\description{
Calculates the Correlation-Adjusted (marginal) coRelation scores
(short CAR scores) implemented in \code{\link[care:carscore]{care::carscore()}} in package
\CRANpkg{care}. The CAR scores for a set of features are defined as the
correlations between the target and the decorrelated features. The filter
returns the absolute value of the calculated scores.

Argument \code{verbose} defaults to \code{FALSE}.
}
\examples{
task = mlr3::tsk("mtcars")
filter = flt("carscore")
filter$calculate(task)
head(as.data.table(filter), 3)

## changing filter settings
filter = flt("carscore")
filter$param_set$values = list("diagonal" = TRUE)
filter$calculate(task)
head(as.data.table(filter), 3)
}
\seealso{
\link[mlr3misc:Dictionary]{Dictionary} of \link[=Filter]{Filters}: \link{mlr_filters}

Other Filter: 
\code{\link{Filter}},
\code{\link{mlr_filters_anova}},
\code{\link{mlr_filters_auc}},
\code{\link{mlr_filters_cmim}},
\code{\link{mlr_filters_correlation}},
\code{\link{mlr_filters_disr}},
\code{\link{mlr_filters_find_correlation}},
\code{\link{mlr_filters_importance}},
\code{\link{mlr_filters_information_gain}},
\code{\link{mlr_filters_jmim}},
\code{\link{mlr_filters_jmi}},
\code{\link{mlr_filters_kruskal_test}},
\code{\link{mlr_filters_mim}},
\code{\link{mlr_filters_mrmr}},
\code{\link{mlr_filters_njmim}},
\code{\link{mlr_filters_performance}},
\code{\link{mlr_filters_permutation}},
\code{\link{mlr_filters_variance}},
\code{\link{mlr_filters}}
}
\concept{Filter}
\section{Super class}{
\code{\link[mlr3filters:Filter]{mlr3filters::Filter}} -> \code{FilterCarScore}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{FilterCarScore$new()}}
\item \href{#method-clone}{\code{FilterCarScore$clone()}}
}
}
\if{html}{
\out{<details open ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="mlr3filters" data-topic="Filter" data-id="calculate">}\href{../../mlr3filters/html/Filter.html#method-calculate}{\code{mlr3filters::Filter$calculate()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="mlr3filters" data-topic="Filter" data-id="format">}\href{../../mlr3filters/html/Filter.html#method-format}{\code{mlr3filters::Filter$format()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="mlr3filters" data-topic="Filter" data-id="help">}\href{../../mlr3filters/html/Filter.html#method-help}{\code{mlr3filters::Filter$help()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="mlr3filters" data-topic="Filter" data-id="print">}\href{../../mlr3filters/html/Filter.html#method-print}{\code{mlr3filters::Filter$print()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
Create a FilterCarScore object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FilterCarScore$new()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FilterCarScore$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
