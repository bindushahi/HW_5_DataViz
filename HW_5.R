library(ggplot2)
library(mapdata)
library(dplyr)

setwd("C:/Users/user/Desktop/HW_5_DataViz")

# (a)
states <- map_data("state")

# Filter California
california <- states %>%
  filter(region == "california")

#(b)
# Load wind turbine data
load("wind_turbines.rda")
colnames(wind_turbines)

# Filter turbines located in California
wind_ca <- wind_turbines %>%
  filter(t_state == "CA")

# (c) and (d) 
# Plot California map and wind turbines
ggplot() +
  geom_polygon(data = california,
               aes(x = long, y = lat, group = group),
               fill = "blue",
               color = "black") +
  geom_point(data = wind_ca,
             aes(x = xlong, y = ylat),
             color = "orange",
             size = 1) +
  guides(fill = "none")