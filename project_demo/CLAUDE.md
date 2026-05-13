# CLAUDE.md

> This file is the **persistent memory** of this project, addressed to any future
> agent (or future-you) that opens it. Edit it as the project evolves. Anything
> not in this file, in `plan.md`, in code comments, or in commits **does not
> exist** to the next session.

## Project

- **Title:** South African elections (demo project for MY580)
- **Question:** How has the geography of South Africa's elections changed from 2019 to 2024? 
- **Researcher(s):** Daniel de Kadt

## Initial prompt

We are going to create a short research project, rendered as an .html document from a .qmd runner. 

The project will analyze the geography of South Africa's elections, and how that has changed from 2019 to 2024. 

We will plan the project together, but as you build the plan you will need to do at least the following:

- Write code to clean and process the data. I haven given you the raw data in `data/raw/`, which I sourced responsibly.

- Write code to run the relevant analyses.

- All code should be functional, well-documented, and orchestrated through {targets}. For today we are going to ignore all suggestions of {groundhog}, even if they are required in the style guide.

## How to work in this repo

- The plain-language plan lives in `plan.md`. **Read it before doing anything.**
- Code lives in `code/R/`. Functions live in `code/R/functions/`. Use `targets`
  for orchestration.
- Raw data lives in `data/raw/` and is **never modified**. Processed data lives
  in `data/processed/` and is **never committed** (see `.gitignore`).
- Code is orchestrated through the runner .qmd file. Always execute that file, never each R script separately.

## Skills in `.claude/skills/`

Five project-scoped skills are available. Each has its own `SKILL.md` with
full instructions.

- **`style-guide`** -- the project's R style guide (directory structure, `.qmd`
  runner, `targets`, `groundhog`, naming, tests). Consult before writing R code.
- **`maintenance`** -- testing, linting, refactoring, documentation pass.
  Propose before implementing. Requires a clean git state.
- **`sweep`** -- full pipeline rebuild from scratch to verify reproducibility.
  Requires a clean git state.
- **`reviewer`** -- adversarial pre-submission review of a manuscript,
  calibrated to a specified journal type. Requires the journal type to be
  specified at invocation.
- **`critic`** -- adversarial review of the most recent piece of work, delegated
  to a fresh-context sub-agent. Produces a short critical document at
  `critiques/`. Use to poke holes before shipping.

## Conventions

- R (>= 4.3); Tidyverse + `targets` + `sf` for spatial.
- Variables: snake_case. Functions: snake_case verbs. Files: snake_case.
- Tables and figures are **always** programmatically generated. No manual edits.
- Commit messages: short, imperative mood ("add ward merge function", not "added").

## Data sources

- TODO -- list each source with URL, license, and the function that ingests it.

## Things you (the agent) MUST NOT do

- **Do not modify files in `data/raw/`.** Ever.
- **Do not interpret results unless asked.** Produce the table or figure; the human writes the
  paragraph.
- **Do not change variable definitions silently.** If a recoding is needed,
  propose it and wait.
- **Do not change key functions silently.** If you need to change functions, report diff.
- **Do not invent citations.** If you do not know a reference, say so.
