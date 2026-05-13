---
name: critic
description: Adversarial review of the most recent piece of work in the current session, delegated to a sub-agent with fresh context. Probes for errors, untested assumptions, and glossed-over decisions. Produces a short critical document for the user. Use when asked to "critique", "be skeptical", "challenge me", or "find what's wrong".
---

# Critic

A skeptical second pair of eyes on the work just produced -- find what is wrong, weak, or unjustified before the user does.

## Procedure

1. **Identify the artefact.** The most recent piece of work in this session: a function, model, figure, paragraph, data-cleaning step, methodological choice. If multiple candidates are plausible, name them and ask.

2. **Launch a sub-agent with fresh context.** Hand it the artefact and the minimum context (what the user is doing, unit of analysis). **No defence of the current approach.**

3. **Sub-agent produces a short critical document** (250--500 words). Format below.

4. **Save and report.** Write to `critiques/YYYY-MM-DD_HHMM_<short-slug>.md` and report the path. Do not summarise or soften.

## What to probe

- **Untested assumptions.**
- **Stated but unverified facts.**
- **Logical / inferential gaps.**
- **Glossed-over decisions.**
- **Failure modes not considered.**
- **Sycophancy in the original work.**

## What NOT to do

- **Do not validate.** If nothing material is found, say so and list what was checked.
- **Do not propose fixes.** The critic finds problems.
- **Do not be generic.** Cite line numbers, variables, sentences.
- **Do not pile on minutiae.** Five real problems beat fifty stylistic nits.

## Output format

```markdown
# Critique: <one-line topic>

**Artefact:** <file path(s) or description>
**Date:** <YYYY-MM-DD HH:MM>

## Findings

1. **<short label>.** 2--3 sentences. Cite specifically.
2. ...

## Assumptions left unverified

- <one-line each>

## What was checked and found OK

- <Brief.>
```
