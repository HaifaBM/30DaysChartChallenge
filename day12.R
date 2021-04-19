library(ggplot2)
library(dplyr)
marvel <- filter(marvel, SEX != "", ALIGN != "", Year != "") %>% 
  filter(!is.na(APPEARANCES), APPEARANCES>100) %>% 
  mutate(SEX = stringr::str_replace(SEX, "Characters", "")) %>% 
  arrange(desc(APPEARANCES)) %>%
  rename(gender = SEX) %>% 
  rename_all(tolower)

marvel_count <- count(marvel, year)
glimpse(marvel_count)

ggplot(data = marvel_count, aes(year, n)) +
  geom_line(color = "steelblue",size = 1) +
  geom_point(color="steelblue") + 
  labs(title = "New Marvel characters by year",
       subtitle = "(limited to characters with more than 100 appearances)",
       y = "Count of new characters", x = "")

stripchart(APPEARANCES~Year,
           data=marvel,
           main="Different strip chart for each month",
           xlab="Months",
           ylab="Temperature",
           col="brown3",
           vertical=TRUE,
           pch=16
)
names(marvel)
library(readxl)
marvel <- read_excel("C:/Users/Haifa.Benmessaoud/Desktop/marvel-wikia-data.xlsx")
library(dplyr)
library(ggplot2)
library(ggridges)
library(wesanderson)
library(extrafont)
library(RColorBrewer)

ggplot(data=marvel, aes(x = eye,y = appearances, colour=appearances)) +
  geom_point() +
  labs(title = 'Average Daily Temperature in Moscow',
       caption = 'Data Source: Kaggle / University of Dayton\n Created by: dosullivan019',
       x='Month',
       y='Temperature (C)',
       colour= 'Temp (C)') +
  scale_colour_viridis_c(option='plasma') +
  theme(legend.position='top',
        panel.background = element_rect(fill='white'),
        plot.title=element_text(family='Georgia', size=20, hjust=0.5),
        plot.caption = element_text(face='italic', size=9),
        axis.title.x = element_text(family='Georgia', size=12),
        axis.title.y = element_text(family='Georgia', size=14),
        axis.text = element_text(family='Georgia',size=11))

p <- ggplot(marvel, aes(Year, APPEARANCES,colour=APPEARANCES))+ 
     geom_point()+
     labs(title = 'Appearances of Marvel Caracters by year',
           caption = 'Data Source: Kaggle \n Created by : Haifa Ben Messaoud',
           x='Year',
           y='Number of appearances',
           colour= 'Number of appearances')+
     scale_colour_viridis_c(option='magma') +
     theme(legend.position='bottom',
        panel.background = element_rect(fill='white'),
        plot.title=element_text(family='serif', size=24, hjust=0.5),
        plot.caption = element_text(face='italic', size=9),
        axis.title.x = element_text(family='serif',face='bold', size=14),
        axis.title.y = element_text(family='serif',face='bold', size=14),
        axis.text = element_text(family='serif',size=11))


library(magick)

logo <- image_read("C:/Users/Haifa.Benmessaoud/Desktop/marvel1.png")
p
grid::grid.raster(logo, x = 0.07, y = 0.03, just = c('left', 'bottom'), width = unit(1, 'inches'))

