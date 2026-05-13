---
name: style-guide
description: R style guide: directory structure, .qmd runner, targets, naming, function docs. Use when writing or refactoring R code, or reviewing a diff for style consistency.
---

# Project Style Guide: R Research Projects

Conventions for R-based academic research projects. Adopt what fits; adapt what doesn't.

---

## Directory structure

```
project_name/
├── code/
│   ├── runner.qmd                # single entry point
│   ├── _targets.R                # pipeline DAG (if using targets)
│   ├── scripts/                  # all .R files: functions only, no loose code
│   │   ├── constants.R           # global constants and configuration
│   │   ├── tools.R               # shared helper functions
│   │   ├── groundhog_custom.R    # package management wrapper
│   │   ├── table_*.R             # one file per table (or family)
│   │   └── figure_*.R            # one file per figure (or family)
│   ├── tests/                    # validation scripts
│   └── deprecated/               # old code kept for reference, never sourced
├── data/                         # raw data; never modified
├── tables/                       # generated .tex / .csv
├── figures/                      # generated .pdf / .png
├── temp/                         # ephemeral; gitignored
├── writing/                      # manuscript + bibliography
└── for_claude/                   # AI instructions and planning docs
```

### Key principles

- **One runner to rule them all.** The whole pipeline runs from a single `.qmd` file. Press "Run All" → reproduce every output.
- **No ad hoc script execution.** Don't run individual `.R` files or `Rscript -e "..."` to produce outputs. Always go through `runner.qmd`. Ad hoc execution bypasses version pinning and dependency tracking.
- **Raw data is read-only.** Never modify files in `data/`.
- **Functions live in `scripts/`.** No loose procedural code.
- **Outputs are disposable.** Anything in `tables/` and `figures/` is regenerable. Nothing hand-edited lives here.
- **Deprecated code goes to `deprecated/`**, not the trash -- searchable but clearly inactive.

---

## The runner file (`.qmd`)

**Why `.qmd` and not `.R`?** A Quarto file auto-sets its working directory to its own location. Relative paths resolve correctly without `.Rproj` or `here::here()`. A plain `.R` script's working directory depends on how RStudio or the terminal was launched -- a common "works on my machine" failure.

We deliberately avoid `.Rproj` files (invasive: they create `.Rproj.user/`, change RStudio behaviour, encourage IDE-specific assumptions).

Minimal pattern:

```markdown
# Setup
```{r setup}
source("scripts/constants.R")
source("scripts/groundhog_custom.R")
pkgs <- c("tidyverse", "haven", "fixest", "modelsummary", ...)
groundhog_custom(pkgs, "YYYY-MM-DD", update = TRUE)
```

# Pipeline
```{r pipeline}
targets::tar_make()
```
```

Conventions:
- **Chunk names match function names.** If a chunk calls `table_balance()`, the chunk is named `table_balance`.
- **One function call per chunk** where possible.
- **The runner reads like a table of contents** for the paper's results.

---

## `{targets}` pipeline

For projects with multiple data sources, slow steps, or complex dependency chains, `{targets}` replaces direct function calls with a dependency-aware DAG.

`_targets.R` sits beside `runner.qmd`, sources all scripts, sets the package context, defines targets:

```r
library(targets)
lapply(list.files("scripts", pattern = "\\.R$", full.names = TRUE), source)
tar_option_set(packages = c("tidyverse", "fixest", "modelsummary"))

list(
  tar_target(file_data, constants$data_path, format = "file"),
  tar_target(dat, clean_data(haven::read_dta(file_data))),
  tar_target(main_table, table_main(dat)),
  tar_target(main_figure, figure_main(dat))
)
```

Key conventions:
- **Each target calls exactly one function.** That function handles its own output side-effect (`.tex` / `.pdf` to disk) and returns an R object for downstream targets.
- **`format = "file"` for raw data** so the pipeline detects when source files change.
- **Keep the package list in sync** between `groundhog_custom()` in the runner and `tar_option_set(packages = ...)`.
- **Don't commit `_targets/objects/`** -- regenerable and can be large.

For simple projects with a single data source and fast computations, skip `{targets}` and use direct function calls in the runner.

---

## Constants (`constants.R`)

Project-wide configuration in a single named list. Sourced first; available everywhere:

```r
constants <- list(
  outtab = "../tables/",
  outfig = "../figures/",
  data_main = "../data/source_a/main_data.dta",
  bandwidth = 20,
  outcomes  = c("outcome_1", "outcome_2"),
  cmap = c("treatment" = "Treatment", "(Intercept)" = "Intercept")
)
```

Use `constants$outtab` everywhere. Namespaced and discoverable. **Don't** put values used by only one function in `constants`; keep those local.

---

## Scripts (`tools.R`, `table_*.R`, `figure_*.R`)

- `tools.R` -- helpers used by **more than one script**. If only one script uses it, leave it there. Functions migrate to `tools.R` when a second script needs them.
- `table_*.R` -- each file defines one function (or small family) producing one or more tables. File name matches the function (`table_main.R` → `table_main()`). Output: `tab_main.tex`.
- `figure_*.R` -- same pattern. Function saves to disk **and** returns the plot object.

Pick one estimation package per project and use it consistently (`fixest::feols()` for panel/IV/clustered SEs, `estimatr::lm_robust()` for cross-sectional experiments). Use `modelsummary()` for all `.tex` output. Use `ggsave()` to PDF for figures.

---

## Package management (`groundhog_custom.R`)

We use a `groundhog` wrapper that pins package versions and auto-increments the snapshot date in 6-month windows. Three modes: `fallback = TRUE` (dev), `fallback = FALSE, update = TRUE` (production), `fallback = FALSE, update = FALSE` (archival, locks the original date for final submission).

The wrapper definition itself lives in `scripts/groundhog_custom.R`.

---

## Naming conventions

| Thing | Convention | Example |
|---|---|---|
| Variables | `snake_case` | `vote_share`, `turnout` |
| Functions | `snake_case`, prefixed by output type | `table_main()`, `figure_pooled()` |
| Script files | match the primary function | `table_main.R` |
| Output files | `tab_` or `fig_` prefix | `tab_main.tex`, `fig_pooled.pdf` |
| Constants | `constants$<name>` | `constants$bandwidth` |
| Target names | `snake_case`, descriptive | `dat_cleaned`, `models_main` |

---

## Function documentation

Every function gets a header comment:

```r
my_function <- function(foo, bar) {
  # brief description of what the function does
  # inputs:
  #   foo: description
  #   bar: description
  # outputs:
  #   description of what is returned or saved to disk
  ...
}
```

Lightweight -- not roxygen. State inputs, outputs, purpose.

---

## Sibling skills

- **`sweep` skill** -- full pipeline rebuild from scratch to verify reproducibility.
- **`maintenance` skill** -- testing, linting, refactoring, documentation passes.

Both require a clean git state before starting.
