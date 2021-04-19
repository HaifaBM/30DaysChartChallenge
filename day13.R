library(readxl)
Pokemon <- read_excel("C:/Users/Haifa.Benmessaoud/Desktop/Pokemon.xlsx")
View(Pokemon)
names(Pokemon)
library(ggplot2)
ggplot(Pokemon, aes(x = Speed, y = Sp.Atk,color=as.factor(Generation))) +
  geom_point()+
  stat_smooth(method = "lm",
              col = "#C42126",
              se = FALSE,
              size = 1)+
  scale_color_brewer(palette="Dark2")+
  labs(
    x = "Speed",
    y = "Speed of attack",
    color = "Generation",
    title = "Relation between Speed and Speed of attack of pokemons ",
    caption = "Data Source : Kaggle"
  )+ theme_minimal()