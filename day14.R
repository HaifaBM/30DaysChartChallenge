library(dplyr)
data(starwars)
names(starwars)
library(ggplot2)
library(magick)
starwars2 <- filter(starwars, name != "Jabba Desilijic Tiure")
library(ggdark)
p <- ggplot(starwars2, aes(x = height, y = mass)) +
  geom_point(color="#d6aa16",size = 4,shape =8)+
  stat_smooth(method = "lm",
              linetype="dashed",
              col = "white",
              se = FALSE,
              size = 1)+
  labs(
    x = "Height",
    y = "Mass",
    title = "Relation between Height and Mass in Star Wars ",
    caption = "dplyr package in R \n Created by : Haifa Ben Messaoud"
  )+ dark_theme_bw() +
  theme(plot.title = element_text(color = "white",face = 'bold'))

logo <- image_read("C:/Users/Haifa.Benmessaoud/Desktop/starwars1.png")
p
grid::grid.raster(logo, x = 0.07, y = 0.01, just = c('left', 'bottom'), width = unit(1, 'inches'))