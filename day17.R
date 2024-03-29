# Loading the libraries
library(tidytuesdayR)
library(dplyr)
library(ggplot2)
library(viridisLite)
library(ggdark)

# Loading the data
tuesdata <- tidytuesdayR::tt_load('2020-01-21') 
tuesdata <- tidytuesdayR::tt_load(2020, week = 4)
pop_songs <- filter(spotify_songs,playlist_genre =='pop')

# Creating the graph
p <- ggplot(pop_songs, aes(danceability, energy))+
  geom_point(aes(color = factor(playlist_subgenre)))+
  scale_color_viridis(discrete=TRUE,option="plasma") +
  labs(title = "Relationship between energy and danceability \n in spotify pop song",
       x = "Danceability",
       y = "Energy",
       color = "Playlist \n subgenre",
       caption = "Data source : Tidy Tuesday data")
p + dark_theme_minimal()
p 