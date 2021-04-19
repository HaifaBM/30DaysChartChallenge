install.packages("corrplot")
library(readxl)
PS <- read_excel("C:/Users/Haifa.Benmessaoud/Downloads/PS.xlsx")
library(corrplot)
library(RColorBrewer)
M<-cor(PS[,2:17])
head(round(M,2))
p.mat <- cor.mtest(PS[,2:17])$p
res1 <- cor.mtest(PS[,2:17], conf.level = .95)
corrplot(M, method="color",tl.col="black",order = "hclust",p.mat = res1$p, insig = "label_sig",
         sig.level = c(.001, .01, .05), pch.cex = .9, pch.col = "white")
