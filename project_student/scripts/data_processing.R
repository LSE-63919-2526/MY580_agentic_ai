library(tidyverse)
library(readxl)
library(sf)

# 1. Load Income Data
income_path <- "data/raw/ons_income_msoa_2023.xlsx"
# We saw that row 4 (Excel index 4) is where headers are, so skip=3 in read_excel (which is 0-indexed for rows before header)
income_data <- read_excel(income_path, sheet = "Total annual income", skip = 3) %>%
  select(msoa_code = 1, # First column
         total_income = 7) %>% # Total annual household income is the 7th column in my peek
  mutate(total_income = as.numeric(total_income))

# 2. Load Census Data (Qualifications - ts067.csv)
census_path <- "data/raw/census/ts067.csv"
census_data <- read_csv(census_path) %>%
  select(msoa_code = `geography code`,
         total_pop_16plus = `Highest level of qualification: Total: All usual residents aged 16 years and over`,
         high_qual = `Highest level of qualification: Level 4 qualifications and above`) %>%
  mutate(pct_high_qual = (high_qual / total_pop_16plus) * 100)

# 2b. Load Census Data (Method of travel - ts061.csv for WFH proxy)
wfh_path <- "data/raw/census/ts061.csv"
wfh_data <- read_csv(wfh_path) %>%
  select(msoa_code = `geography code`,
         total_employed = 4, # "Method of travel to workplace: Total..."
         wfh = 5) %>% # "Method of travel to workplace: Work mainly at or from home"
  mutate(pct_wfh = (wfh / total_employed) * 100)

# 3. Load London MSOA Boundaries
london_msoas <- st_read("data/raw/MSOA_2021_London.geojson") %>%
  rename(msoa_code = MSOA21CD) %>%
  mutate(borough = str_remove(MSOA21NM, " [0-9]{3}$"))

# 4. Join and Filter
final_data <- london_msoas %>%
  left_join(income_data, by = "msoa_code") %>%
  left_join(census_data, by = "msoa_code") %>%
  left_join(wfh_data, by = "msoa_code")

# 5. Save processed data
saveRDS(final_data, "data/processed_data.rds")
