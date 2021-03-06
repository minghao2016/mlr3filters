#' @title Correlation Filter
#'
#' @name mlr_filters_correlation
#'
#' @description
#' Simple correlation filter calling [stats::cor()].
#' The filter score is the absolute value of the correlation.
#'
#' @family Filter
#' @template seealso_filter
#' @export
#' @examples
#' ## Pearson (default)
#' task = mlr3::tsk("mtcars")
#' filter = flt("correlation")
#' filter$calculate(task)
#' as.data.table(filter)
#'
#' ## Spearman
#' filter = FilterCorrelation$new()
#' filter$param_set$values = list("method" = "spearman")
#' filter$calculate(task)
#' as.data.table(filter)
FilterCorrelation = R6Class("FilterCorrelation",
  inherit = Filter,

  public = list(

    #' @description Create a FilterCorrelation object.
    initialize = function() {
      param_set = ParamSet$new(list(
        ParamFct$new("use", default = "everything",
          levels = c(
            "everything", "all.obs", "complete.obs", "na.or.complete",
            "pairwise.complete.obs")),
        ParamFct$new("method", default = "pearson",
          levels = c("pearson", "kendall", "spearman"))
      ))

      super$initialize(
        id = "correlation",
        task_type = "regr",
        param_set = param_set,
        feature_types = c("integer", "numeric"),
        packages = "stats",
        man = "mlr3filters::mlr_filters_correlation"
      )
    }
  ),

  private = list(
    .calculate = function(task, nfeat) {
      fn = task$feature_names
      pv = self$param_set$values
      score = invoke(stats::cor,
        x = as.matrix(task$data(cols = fn)),
        y = as.matrix(task$truth()),
        .args = pv)[, 1L]
      set_names(abs(score), fn)
    }
  )
)

#' @include mlr_filters.R
mlr_filters$add("correlation", FilterCorrelation)
