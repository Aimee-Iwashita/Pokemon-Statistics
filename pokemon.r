# Load the required packages 
library(tidyverse)
library("rstatix")

# Read in the csv 
pokemon <- read.csv("pokemon_clean.csv")
head(pokemon)
str(pokemon)

# Fix the class types 
pokemon <- pokemon%>%
  mutate(legendary = ifelse(pokemon$legendary == 't', TRUE, FALSE))

pokemon$type1 <- as.factor(pokemon$type1)
pokemon$type2 <- as.factor(pokemon$type2)


# Overall summary
summary(pokemon)

# total stats of legendary vs non-legendary pokemons 
pokemon %>%
  group_by(legendary) %>%
  get_summary_stats(total, type = "common")

# Visualise the data
boxplot(total ~ legendary, data = pokemon, main = "Total Stats of Pokemon: Legendary vs. Non-Legendary")

# Assumption checks
# Outliers
pokemon %>%
  group_by(legendary) %>%
  identify_outliers(total)

legendary.lm <- lm(total ~ legendary, data = pokemon)
plot(legendary.lm, which = 4)
max(cooks.distance(legendary.lm))

# Equality of variance
plot(legendary.lm, which = 1)

# Normality
plot(legendary.lm, which = 2)

legend.res <- residuals(legendary.lm)
shapiro.test(legend.res)

# Density plot
pokemon %>%
  ggplot(aes(x = total, group = legendary, fill = legendary)) +
  geom_density(alpha = 0.2) 

## Bootstrapping ##
# Separate legendary and non-legendary Pokemon data into different dataframe 
legendary <- pokemon %>%
  filter(legendary == TRUE)

non_legendary <- pokemon %>%
  filter(legendary == FALSE)

# number of rows in each dataframe (so the re-sampled data has the same size as the original data)
n.legend <- nrow(legendary)
n.non_legend <- nrow(non_legendary)

# Number of iterations 
n.boot <- 10000

# Vectors to store the results
mean_diff <- median_diff <- numeric(n.boot)

set.seed(123)

for (i in 1:n.boot){
  # Re-sampling rows of the dataframe 
  samp.legend <- sample(1:n.legend, size = n.legend, replace = TRUE)
  samp.non_legend <- sample(1:n.non_legend, size = n.non_legend, replace = TRUE)
  
  # Re-sampled dataframe 
  legend_new <- legendary[samp.legend,]
  non_legend_new <- non_legendary[samp.non_legend,]
  
  # Computing the difference between means and medians
  mean_diff[i] <- mean(legend_new$total) - mean(non_legend_new$total)
  median_diff[i] <- median(legend_new$total) - median(non_legend_new$total)
}

# Confidence intervals
quantile(mean_diff, probs = c(0.025, 0.975))
quantile(median_diff, probs = c(0.025, 0.975))



## Type 1 and 2 combination ##

type_comb <- paste(pokemon$type1, pokemon$type2, sep = "/")
type_comb <- ifelse(grepl(".+/$", type_comb), gsub("/", "", type_comb), type_comb)

type_comb_summary <- pokemon %>% 
  mutate(type_comb = type_comb) %>%
  group_by(type_comb) %>%
  summarise(count = n())

type_comb_summary <- type_comb_summary[order(type_comb_summary$count, decreasing = TRUE),]
type_comb_summary

pokemon %>%
  filter(type2 != "") %>%
  group_by(type1, type2) %>%
  count(type1, type2, name = "count") %>%
  ggplot(aes(x = type1, y = type2)) +
  geom_tile(aes(fill = count)) +
  scale_fill_gradient(low = "lightblue", high = "red")




