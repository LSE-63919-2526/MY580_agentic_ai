# functions.R
#
# Project-specific functions. Add to this file as you go.
# (Or split into per-function files in code/R/functions/ once it gets long.)
#
# Convention: each function declared here also has its purpose described in
# CLAUDE.md or in plan.md if it is load-bearing for the design.

# example: groundhog wrapper, copied from MY580 Reproducible Pipelines
groundhog_package_check <- function(need, groundhog.date = Sys.Date() - 7) {
  need <- c(need, "groundhog")
  have <- need %in% rownames(installed.packages())
  if (any(!have)) install.packages(need[!have])
  invisible(lapply(need, groundhog::groundhog.library, date = groundhog.date))
}
