# Census Data Wrangling

## Overview
Workflows for processing UK Census 2021 data (Nomis/ONS) at MSOA, LSOA, and OA levels.

## Data Structures
- **Geography Codes**: MSOA (E02...), LSOA (E01...), OA (E00...). Ensure consistency across datasets.
- **Variable Normalization**: Most census files (`ts*.csv`) provide counts. Always convert to percentages or rates using the "Total" column for meaningful comparisons.

## Procedures
1. **Cleaning**: Remove metadata rows/columns. Rename long ONS column headers to short, programmatic names.
2. **Joining**: MSOA codes are the standard unit for small-area model-based estimates. Use them as the primary key.
3. **Validation**: Check for missing geographies (e.g., City of London or Isles of Scilly) which are often outliers or missing in some datasets.
