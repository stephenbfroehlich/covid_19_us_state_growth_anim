library(tidyverse)
library(jsonlite)
library(anytime)
library(plotly)
library(glue)
library(gganimate)
library(data.table)
library(dtplyr)
library(janitor)
library(ggrepel)

state_nums <- 
  fromJSON("https://covidtracking.com/api/states/daily") %>% 
  clean_names() %>% 
  mutate(date = date %>% as.character() %>% anydate(calcUnique = TRUE),
         date_checked = anytime(date_checked, calcUnique = TRUE))
  


# Animated progress by state ----------------------------------------------


covid_state_anim <-
  state_nums %>%
  group_by(state) %>%
  arrange(state, date) %>%
  as.data.table() %>% 
  split(
    by = "state"
  ) %>% 
  map_dfr(
    function(dat){
      dat <- as.data.table(dat)

      wpi <- 
        map_int(
        seq_len(nrow(dat)),
        function(i){
          sum(
            dat$positive_increase[
              dat$date >= (dat$date[i] - lubridate::days(6)) &
                dat$date <= dat$date[i]
              ],
              na.rm = TRUE)
        }
      )
      
      dat[
        , 
        week_positive_increase := wpi
        ]
      
      return(dat)
    }
  ) %>% 
  as_tibble() %>% 
  #if we don't filter down
  filter(!is.na(week_positive_increase) &
           week_positive_increase >= 1) %>%
  rename(obs_date = date) %>%
  ggplot(aes(
    x = positive,
    y = week_positive_increase,
    colour = fct_reorder(state, positive, .fun = max),
    label = state,
    group = state
  )) +
  geom_line(colour = "black", alpha = .1) +
  geom_point(alpha = .75, stroke = 0) +
  geom_text(size = 2.5, hjust = -0.1, vjust = 1.1, alpha = .75) +
  scale_colour_viridis_d(guide = FALSE, end = .75, direction = -1) +
  labs(
    title = "COVID-19 Progress by State  -  {format(frame_along, format = '%b-%e')}",
    x = "Total Positive Test Results",
    y = "Positive Tests in Preceeding Week"
  ) +
  scale_x_log10() +
  scale_y_log10() +
  theme_minimal() +
  transition_reveal(obs_date) +
  theme(
    axis.title.y = element_text(margin = margin(r = 17.5)),
    axis.title.x = element_text(hjust = 1),
    plot.title.position = "plot"
  ) +
  view_follow()

fps <- 6

animate(
  covid_state_anim,
  duration = 30L,
  fps = fps,
  start_pause = 2 * fps,
  end_pause = 5 * fps,
  height = 600,
  width = 800,
  res = 125
)

