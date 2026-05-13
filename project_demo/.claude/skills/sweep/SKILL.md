---
name: sweep
description: Full pipeline rebuild from scratch to verify reproducibility. Clears the cache, re-runs every step, verifies outputs match what was previously committed. Requires a clean git state before starting, if git is used.
---

# Sweep

Verify the repo is reproducible from scratch. **If unsure at any step, STOP AND ASK.**

## Procedure

1. **Check git state.** Run `git status`. If there are uncommitted changes, or the branch is not up to date with the remote, STOP and report back. If the project is not tracked with git, you can ignore this.

2. **Identify pipeline outputs.** List the folders that house pipeline-generated files ("output folders") and the files inside them ("output files").

3. **Verify safety.** Confirm that (a) all files in the output folders are pipeline-generated, and (b) all pipeline-generated files live inside the output folders. If either is false, STOP and report back.

4. **Move outputs aside.** Move every file in the output folders to a temp folder inside the project. Output folders should now be empty.

5. **Clear the cache and rebuild.** Delete the `_targets/` store (or equivalent). Re-run the pipeline from scratch.

6. **Verify the rebuild.**
  - If the pipeline ran without error: delete the temp folder.
  - If the pipeline errored: restore the original files from temp and report the error.

7. **Recompile the paper** if any table or figure was regenerated.

8. **Report.** One status report at the end: what was regenerated, any deltas vs. the originals, any anomalies.
