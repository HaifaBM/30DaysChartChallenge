# library
library(igraph)
library(RColorBrewer)

# data
# head(mtcars)

# Make a correlation matrix:
mat <- cor(t(mtcars[,c(1,3:6)]))
# Keep only high correlations
mat[mat<0.995] <- 0

# color palette
coul <- brewer.pal(nlevels(as.factor(mtcars$cyl)), "Dark2")

# Map the color to cylinders
my_color <- coul[as.numeric(as.factor(mtcars$cyl))]

# plot
par(bg="grey12", mar=c(0,0,0,0))
set.seed(4)
plot(network, 
     vertex.size=12,
     vertex.color=my_color, 
     vertex.label.cex=0.7,
     vertex.label.color="white",
     vertex.frame.color="transparent",
     edge.color="white",                           # Edge color
     edge.width=1,                                 # Edge width, defaults to 1
     edge.arrow.size=1,                            # Arrow size, defaults to 1
     edge.arrow.width=1,                           # Arrow width, defaults to 1
     edge.lty="solid",                             # Line type, could be 0 or "blank", 1 or "solid", 2 or "dashed", 3 or "dotted", 4 or "dotdash", 5 or "longdash", 6 or "twodash"
     edge.curved=0.3    ,                          # Edge curvature, range 0-1 (FALSE sets it to 0, TRUE to 0.5)
)

# title and legend
text(0,0,"Plot mtcars network",col="white", cex=1.5)
legend(x=-0.2, y=-0.12, 
       legend=paste( levels(as.factor(mtcars$cyl)), " cylinders", sep=""), 
       col = coul , 
       bty = "n", pch=20 , pt.cex = 2, cex = 1,
       text.col="white" , horiz = F)