
library(ggplot2)
library(grid)
library(magick)

theme_set(theme_minimal())
cow <- image_read("C:/Users/Haifa.Benmessaoud/Desktop/cow.png")
image <- image_fill(cow, 'none')
raster <- as.raster(image)
p <- ggplot(data = milk, aes(x = year, y = milk_per_cow)) + 
  geom_line(color = "grey", size = 1.2)+
  labs(x = "Year", y = "Milk per cow",title = "Yearly milk production per cow",
       caption = "Data: Tidytuesday 2019-01-29 milkcow facts \n Created by : Haifa Ben Messaoud") +
  theme(plot.title = element_text(face = "bold",margin = margin(10, 0, 10, 0),size = 16),
        axis.title.x = element_text(vjust = 0, size = 15,face = "italic"),
        axis.title.y = element_text(vjust = 2, size = 15))
p
grid.raster(image,just = c('left', 'top'),x = 0.8, y = 0.3, width = unit(1, 'inches'))