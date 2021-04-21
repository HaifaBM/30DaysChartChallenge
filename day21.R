library(ggplot2)
library(grid)
library(magick)

theme_set(theme_minimal())
cow <- image_read("C:/Users/Haifa.Benmessaoud/Desktop/milk3.png")
image <- image_fill(cow, 'none')
raster <- as.raster(image)
p <- ggplot(data = milk2, aes(x = year, y = fluid_milk)) + 
  geom_line(color = "orchid4", size = 1.2)+
  labs(x = "Year", y = "Fluid milk",title = "Yearly average milk consumption in lbs per person",
       caption = "Data: Tidytuesday 2019-01-29 milk products facts \n Created by : Haifa Ben Messaoud") +
  theme(plot.title = element_text(face = "bold",margin = margin(10, 0, 10, 0),size = 16),
        axis.title.x = element_text(vjust = 0, size = 15,face = "italic"),
        axis.title.y = element_text(vjust = 2, size = 15))
p
grid.raster(image,just = c('right', 'top'),x = 0.95, y = 0.9, width = unit(1.5, 'inches'))