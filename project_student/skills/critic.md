# Code and Research Critic

## Overview
A framework for diagnosing errors, inconsistencies, and methodological flaws in data science and software engineering tasks.

## Diagnostic Checklist

### 1. Data Integrity
- **Join Completeness**: Check for unexpected row drops or NA introductions after joins (`left_join`, `inner_join`).
- **Unit Consistency**: Verify that "Total Income" is not being confused with "Median" or "Mean" if the user specified a particular measure.
- **Outlier Check**: Identify extreme values that might skew visualizations or correlations.

### 2. Code Correctness
- **Path Issues**: Ensure all file paths are relative to the project root and consistent across scripts and Quarto files.
- **Logic Errors**: Check regex (e.g., borough extraction) for edge cases (e.g., "City of London" vs "Westminster 001").
- **Dependency Management**: Confirm all required libraries are loaded and versions are compatible.

### 3. Visual & Output Accuracy
- **Legend Alignment**: Ensure map colors/scales match the data distribution.
- **Interactive States**: Verify that tooltips and hover-states display the correct variables.
- **HTML Artifacts**: Check for broken images, missing CSS, or unrendered LaTeX in Quarto outputs.

## Procedure
1. Run diagnostic scripts (e.g., `summary()`, `colSums(is.na())`).
2. Compare output artifacts against the "ground truth" raw data.
3. Document findings as diffs for user review.
