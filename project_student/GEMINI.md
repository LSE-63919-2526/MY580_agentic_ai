# GEMINI.md

> This file is contains the **persistent memory** of this project, addressed to any future
> agent or user that opens it. Edit the file as the project evolves. Anything not in this
> file, in code comments, or commits  **does not exist** to the next session.


## Project

**Title.** Household Income in London by MSOA
**Question.** How does median household income vary across London at the MSOA level, and how does it relate to additional variables within the dataset?
**Researcher.** Lynlee Rice

## Initial Prompt

Create a short research project. It will use the data from the data folder to analyze London's household income by MSOA level.

The output should be an .html file, written from a .qmd file using R. The .html should include at least **one map** and **one graph**, plus a short paragraph (3-5 sentences) about what you see.

Additional specifications:

    - Add SKILL.md files for spatial analysis (handling simple features, vector data, thematic mapping, and and advanced interactive web maps) and census data wrangling (processing UK Census 2021 data (Nomis/ONS) at MSOA, LSOA, and OA levels). 
        - Best practices for the spatial data analysis SKILL.md should include CRS management and joining data. 
        - Best practices for the census data wrangling SKILL.md should include cleaning, joining, and vaidation.

    - Add analysis based on the region name and additional analysis for years affected by the COVID-19 pandemic if relevant (check statistical significance for years 2020-2023 to see if there is a difference).

    - Make the map interactive (zoom, hover over to show geographic indicator and specific income level, etc.). 

We will plan the project together, but as you build the plan, you will need to do at least the following: 

    - Write code to clean and process the data. I have given you the raw data in 'data/raw/`, which I sourced responsibly. 

    - Write code to run the relevant analyses. 

    - All code should be functional, well-documented, and orchestrated appropriately.


## Research Notes (May 14, 2026)

    - Enhanced Analysis: Expanded the study to include borough-level aggregation and a COVID-19 proxy analysis.

    - COVID-19 Proxy: Used "Work mainly at or from home" rates from the 2021 Census to explore the relationship between pandemic-era work shifts and 2023 income.

    - Findings: Identified a strong positive correlation (r ≈ 0.8) between 2021 WFH rates and 2023 household income, highlighting the resilience of remote-capable high-income sectors.

    - Interactive Mapping**: Implemented an interactive `tmap` visualization in `london_income.html` with borough and WFH tooltips.

    - Skill Standardization**: Introduced `skills/spatial-analysis-r.md` and `skills/census-data-wrangling.md` for project-wide consistency.


## Errors that we made last time:

    - Be careful with edge cases (ex: "City of London" vs. "Westminster 001") and ask if any of the bourough names are confusing. **This was messed up and dropped incorrectly initially.**
    
    - Causal Validity & Multicollinearity: The regression analysis shows extreme multicollinearity between "High Education %" and "Work from Home %" (Correlation = 0.919, VIF = 6.4). While both are statistically significant, the "finding" that WFH and Education independently drive income is statistically shaky because they are so heavily overlapping. In a joint model, the Education coefficient actually becomes negative, which is a classic sign of model instability due to collinearity.

    - Make sure to use "median household income," and not "Total annual household income".