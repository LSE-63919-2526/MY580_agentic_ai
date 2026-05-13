---
name: reviewer
description: Adversarial pre-submission peer review of a manuscript, calibrated to the standards of a specific journal type (general-interest PS, comparative, methods, general science, economics). Use when asked for a review or referee report.
---

# Reviewer

Produce an adversarial pre-submission review, calibrated to the standards of the target journal.

## How to invoke

Journal type **must** be specified. If unspecified, **ASK** -- the wrong frame produces the wrong review.

| Tag | Examples |
|---|---|
| `general-PS` | APSR, AJPS, JOP, BJPolS |
| `comparative-PS` | Comparative Political Studies, World Politics |
| `methods` | Political Analysis, Political Science Research and Methods |
| `general-science` | Science, Nature, PNAS, Nature: Human Behaviour |
| `economics` | AER, QJE, JPE |

## Procedure

1. Confirm the journal type.
2. Read the manuscript: structure, claims, methods, results.
3. Apply the standards for the type (profiles below).
4. Produce a structured referee report (format below).

## Journal-type profiles

### `general-PS`
Theoretical contribution to a general-interest PS conversation. Causal identification rigor paramount; descriptive findings need strong justification. Standard tools well-applied; methodological innovation not required.

**Deal-breakers:** weak identification; no theoretical contribution; over-claiming from observational data; jargon hiding limitations.

### `comparative-PS`
Engagement with the comparative literature is required; comparative leverage is the point. Methodological pluralism acceptable -- qualitative and quantitative both. Substantive area knowledge matters.

**Deal-breakers:** not engaging the comparative literature; treating one case as standalone; methodological choices that ignore the comparative dimension.

### `methods`
The method is the contribution; substantive applications are illustrations. Derivations must be correct; simulation evidence required for any claimed improvement. Honest comparison to existing methods, including disclosure of conditions where the proposed method fails.

**Deal-breakers:** derivation errors; simulations that don't compare to alternatives; claimed improvements without disclosure of failure conditions.

### `general-science`
Significance beyond the field required; counter-intuitive or broadly relevant findings preferred. Brevity demanded; jargon banned; accessible to non-specialists. Methods summarised in main text; details in supplement.

**Deal-breakers:** too narrow; incremental; not surprising; requires deep field knowledge to evaluate.

### `economics`
Causal identification paramount; design must be defensible (RCT, RDD, IV, DiD with credible parallel-trends evidence). Observational claims face very high scrutiny. Empirics usually tied to a theoretical model. Magnitudes matter -- economic significance, not just statistical. Multi-specification robustness expected.

**Deal-breakers:** weak identification; statistical without economic significance; "kitchen sink" regressions; over-claiming external validity from a single context.

## Output format

A referee report with these sections:

- **Summary** (1 paragraph). What the paper argues, main evidence.
- **Recommendation.** One line: Accept / Minor revision / Major revision / Reject.
- **Major comments** (numbered). Substantive concerns. Cite page or section.
- **Minor comments** (numbered). Clarity, citations, typos, figure quality.
- **Confidential note to editor** (optional, short).
