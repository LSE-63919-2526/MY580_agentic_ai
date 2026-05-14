# Spatial Analysis in R

## Overview
Guidelines for performing spatial analysis and mapping in R using `sf`, `tmap`, and `leaflet`.

## Core Libraries
- `sf`: For handling simple features (vector data).
- `tmap`: For thematic maps (static and interactive).
- `leaflet`: For advanced interactive web maps.

## Best Practices
1. **CRS Management**: Always check the Coordinate Reference System (`st_crs`). Use EPSG:4326 for web maps (Leaflet) and EPSG:27700 (British National Grid) for UK-based distance/area calculations.
2. **Joining Data**: Use `left_join` from `dplyr` on the data frame part of an `sf` object. Ensure the join key is clean (no trailing spaces).
3. **Interactive Maps**: Use `tmap_mode("view")` for quick interactivity. Customize popups to provide meaningful context (e.g., area names and key metrics).
4. **Simplification**: Use `st_simplify` on large GeoJSON/Shapefiles to improve rendering performance in HTML reports.
