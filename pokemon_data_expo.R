library(tidyverse)
library("rstatix")

# Read in the csv 
pokemon <- read.csv("pokemon_clean.csv")
head(pokemon)
str(pokemon)

## Data Cleaning ##

# Fix the class types 
pokemon <- pokemon%>%
  mutate(legendary = ifelse(pokemon$legendary == 't', TRUE, FALSE))

pokemon$type1 <- as.factor(pokemon$type1)
pokemon$type2 <- as.factor(pokemon$type2)

# Remove Mega and Gigantamax pokemons 
# mega.index <- grep("^Mega", pokemon.df$name)
# giga.index <- grep("^Gigantamax", pokemon.df$name)

# pokemon <- pokemon[-c(mega.index, giga.index),]

# Overall summary
summary(pokemon)


## Data Exploration ##

# We will combine type1 and type2 together 
# e.g. water/dragon type pokemon will be categorised as water type as well as dragon type 
pokemon_long <- pokemon %>%
  pivot_longer(cols = starts_with("type"), names_to = "type_number", values_to = "type") 
pokemon_long$type[which(pokemon_long$type == "")] <- NA
pokemon_long <- na.omit(pokemon_long)

# Generation distribution
pokemon %>%
  count(generation, name = "count") %>%
  ggplot(aes(x = as_factor(generation), y = count)) +
  geom_bar(stat = "identity", fill = "lightblue") +
  coord_flip() +
  labs( y = "Count", 
        x = "Generation") +
  theme_minimal()

# Type distribution
pokemon_long %>%
  count(type, name = "count") %>%
  ggplot(aes(x = reorder(type, +count), y = count)) +
  geom_bar(stat = "identity", fill = "lightblue") +
  coord_flip() +
  labs( y = "Count", 
       x = "Type") +
  theme_minimal()

# type by gen bar graph
type_dist_graph <- function(data, gen){
  new_data <- data %>%
    filter(generation == gen) %>%
    count(type, name = "count") 
  new_data %>%
    ggplot(aes(x = reorder(type, +count), y = count)) +
    geom_bar(stat = "identity", fill = "lightblue") +
    coord_flip() +
    labs(title = paste("Generation", gen, "Pokemons by Type"), 
         y = "Count", 
         x = "Type")
}

type_dist_graph(data = pokemon_long,gen = 1)
type_dist_graph(data = pokemon_long,gen = 2)
type_dist_graph(data = pokemon_long,gen = 3)
type_dist_graph(data = pokemon_long,gen = 4)
type_dist_graph(data = pokemon_long,gen = 5)
type_dist_graph(data = pokemon_long,gen = 6)
type_dist_graph(data = pokemon_long,gen = 7)
type_dist_graph(data = pokemon_long,gen = 8)



# Comparing each stats by type
# Function that creates boxplot of selected stats by type 
stats_box <- function(category = "total", title = FALSE) {
  data <- pokemon_long %>%
    select(c(type, category))
  
  colnames(data) <- c("type", "val")
  
  median <- data %>%
    group_by(type) %>%
    summarise(median = median(val))
  
  median <- median[order(median$median, decreasing = TRUE),]
  
  data$type <- factor(data$type, levels = median$type)
  
  plot_title = paste("Boxplot of", category, "by type", sep = " ")
  plot_title = ifelse(title, plot_title, "")
  
  data %>%
    ggplot(aes(x = type, y = val, fill = type)) +
    geom_boxplot() +
    theme(legend.position = "none") +
    labs(y = category, title = plot_title)
}

stats_box(category = "total")
stats_box(category = "attack")
stats_box(category = "defense")
stats_box(category = "sp_attack")
stats_box(category = "sp_defense")
stats_box(category = "hp")
stats_box(category = "speed")
