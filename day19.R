library(readxl)
library(ggplot2)
temp <- read_excel("C:/Users/Haifa.Benmessaoud/Desktop/temp.xlsx")
View(temp)
theme_set(theme_minimal())

p <- ggplot(data = temp, aes(x = Year, y = No_Smoothing)) + 
  geom_point(color = "lightcyan3", shape = 21,fill = "white", size = 2.8,stroke = 1.5) +
  geom_line(color = "grey", size = .3)+
  labs(x = "Year", y = "Temperature Anomaly (C)",title = "GLOBAL LAND-OCEAN TEMPERATURE INDEX",
       subtitle = "This graph illustrates the change in global surface temperature \n relative to 1951-1980 average temperatures.",
       caption = "Data: NASA's Goddard Institute for Space Studies (GISS)") +
  theme(axis.title.x = element_text(vjust = 0, size = 15),
        axis.title.y = element_text(vjust = 2, size = 15))
p
p + stat_smooth(
  color = "black",se = FALSE,
  size = 0.8,
  method = "loess"
)