# Causal Inference and Statistical Validation

## Overview
Guidelines for testing the strength and validity of relationships identified in observational data.

## Methodology

### 1. Correlation vs. Causation
- **Spurious Correlation**: Check if two variables are correlated simply because they both correlate with a third variable (e.g., population density or proximity to Central London).
- **Multicollinearity**: If using multiple predictors (e.g., Education AND WFH), check for high correlation between the predictors themselves.

### 2. Regression Analysis
- **Model Fit**: Use `lm()` in R to assess $R^2$ and p-values.
- **Control Variables**: Always include relevant controls to isolate the effect of the primary variable.
- **Residual Analysis**: Check residuals for patterns that suggest a non-linear relationship or omitted variable bias.

### 3. Reporting Standards
- **Significance**: Only report "findings" if p < 0.05 (or a more stringent threshold if multiple testing).
- **Effect Size**: Report coefficients in meaningful units (e.g., "A 10% increase in higher education is associated with a £X,XXX increase in household income").
- **Uncertainty**: Acknowledge the limitations of observational cross-sectional data; avoid "A causes B" in favor of "A is strongly associated with B, even when controlling for C."
