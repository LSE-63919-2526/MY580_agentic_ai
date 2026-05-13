---
name: maintenance
description: Keep the analytical pipeline hygienic, clear, and efficient. Propose changes before implementing. Limit changes to what is clearly needed -- do not over-engineer. Tasks (in priority order): testing, linting, refactoring, documentation, efficiency, sub-agent review. Requires a clean git state before starting.
---

# Maintenance

Keep the analytical pipeline hygienic, clear, and efficient. Propose before implementing; do not over-engineer.

## Prerequisites

Before starting any maintenance work:
- Run `git status` and confirm there are no uncommitted changes.
- Confirm the local branch is up to date with the remote.
- IF THERE ARE UNCOMMITTED CHANGES OR THE REPO IS NOT UP TO DATE, STOP AND REPORT BACK.

## Tasks (in priority order)

1. **Testing**: make sure functions have unit tests or other tests and that they pass. If problems are identified, document and propose solutions.

2. **Linting**: make sure code is linted and follows the project style guide. Consistency is important. If you find inconsistent approaches, unify them.

3. **Refactoring**: make sure code is DRY (Don't Repeat Yourself). If you find WET (Write Everything Twice) code, refactor it to be DRY. Limit refactoring to the file you are already touching -- do not chase abstractions across the codebase.

4. **Documentation**: code should be interpretable and literate. If you find undocumented or unclear code, document it and clarify it.

5. **Efficiency**: if you find code that is inefficient, propose and implement solutions to make it more efficient.

6. **Review**: launch a sub-agent and assign it a single script or module to review against the project style guide and the above maintenance tasks. One script per sub-agent.

## Output

Return a numbered list of proposed changes, grouped by task (tests, linting, refactoring, documentation, efficiency). For each: file path, what you see, and a one-sentence suggested action. **Wait for approval before implementing anything.**
