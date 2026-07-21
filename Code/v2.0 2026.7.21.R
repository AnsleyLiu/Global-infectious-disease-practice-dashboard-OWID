library(tidyverse)
url <- "https://ourworldindata.org/grapher/excess-mortality-p-scores-projected-baseline.csv"#Assign the data url to "url"
covid <- read_csv(url) #Read all the data in the csv file, assign them to "covid"
glimpse(covid) #Check
covid <- covid %>% #Pass the tibble `covid` to the following function
  rename(
    excess_p_score = `Excess mortality P-scores, projected baseline, all ages.` #Rename, use "excess_p_score" replace "Excess mortality P-scores, projected baseline, all ages." to avoid too much words in condition writing, avoid mistakes.
  )
all_country <- covid %>% #Create a new tibble called `all_country`
  filter( Entity %in% c("Chile","Japan","Australia"))
summary_table <- all_country %>% #Summary the table by country
  count(Entity)
p <- ggplot(summary_table, aes(x=Entity, y=n, fill=Entity))+ #Creat a plot by using Entity as x-axis, amount as y-axis, fill the graph as default colour
  geom_col() + #Set up the plot as bar chart
  labs ( #Set up the information
    title = "Data reporting frequency in different countries from 2020 to 2023",
    x = NULL,
    y = "Data reported amount among year"
    ) +
  theme_gray()+ #Set up the theme as gray
  theme(
    legend.position = "none"
  )
p
