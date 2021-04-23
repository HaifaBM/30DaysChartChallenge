# Load an image into R (make sure your working directory is set!)

# Packages (for the entire project)
library(imager)    # image loading and processing
library(dplyr)     # data manipulation
library(ggplot2)   # data visualization
library(tidyr)     # data wrangling
library(ggvoronoi) # visualization
# Load an image into R
img <- load.image(file = "C:/Users/Haifa.Benmessaoud/Desktop/abstract.jpg")
print(img)
# View the image
plot(img)
# Represent the image as a data frame
img_df <- as.data.frame(img)

# Show a table of the first 10 rows of the data frame
img_df %>% 
  arrange(x, y, cc) %>% # sort by columns for viewing
  filter(row_number() < 10) # Select top 10 columns
  

# Add more expressive labels to the colors
img_df <- img_df %>% 
  mutate(channel = case_when(
    cc == 1 ~ "Red",
    cc == 2 ~ "Green", 
    cc == 3 ~ "Blue"
  ))

# Reshape the data frame so that each row is a point
img_wide <- img_df %>%
  select(x, y, channel, value) %>%
  spread(key = channel, value = value) %>%
  mutate(
    color = rgb(Red, Green, Blue)
  )
sample_size <- 2000
img_sample <- img_wide[sample(nrow(img_wide), sample_size), ]

# Create random weights for point size
img_sample$size <- runif(sample_size)

# Plot only the sampled points
ggplot(img_sample) +
  geom_point(mapping = aes(x = x, y = y, color = color, size = size)) +
  guides(size = FALSE) + # don't show the legend
  scale_color_identity() + # use the actual value in the `color` column
  scale_y_reverse() + # Orient the image properly (it's upside down!)
  theme_void() # Remove axes, background

# Use the amount of blue present in each point to determine the size
ggplot(img_sample) +
  geom_point(mapping = aes(x = x, y = y, color = color, size = Blue)) +
  guides(size = FALSE) + # don't show the legend
  scale_color_identity() + # use the actual value in the `color` column
  scale_y_reverse() + # Orient the image properly (it's upside down!)
  theme_void() # Remove axes, background

# Re-create the scatter plot with the re-sampled data (add random sizing of circles)
ggplot(img_edge_sample) +
  geom_point(mapping = aes(x = x, y = y, color = color, size = edge * runif(sample_size))) +
  guides(fill = FALSE, size= FALSE) +
  scale_color_identity() +
  scale_y_reverse() +
  theme_void() # Remove axes, background

# Convert the edge image to a data frame for manipulation
# Detect edges in the image
edges <- cannyEdges(img)
edges_df <- edges %>%  
  as.data.frame() %>% 
  select(x, y) %>% # only select columns of interest
  distinct(x, y) %>% # remove duplicates
  mutate(edge = 1) # indicate that these observations represent an edge

# Join on the edges data
img_wide <- img_wide %>% 
  left_join(edges_df)

# Apply a low weight to the non-edge points
img_wide$edge[is.na(img_wide$edge)] <- .05

# Re-sample from the image, applying a higher probability to the edge points
img_edge_sample <- img_wide[sample(nrow(img_wide), sample_size, prob = img_wide$edge), ]

# Re-create the voronoi diagram with the re-sampled data
ggplot(img_edge_sample) +
  geom_voronoi(mapping = aes(x = x, y = y, fill = color)) +
  scale_fill_identity() +
  guides(fill = FALSE) +
  scale_y_reverse() +
  theme_void() # Remove axes, background
