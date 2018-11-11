# Data wrangling exercise 2: Dealing with missing values
library(tidyr)
library(dplyr)
library(stringr)

# 0. Load the data in RStudio
titanic <- read.csv("titanic_original.csv", stringsAsFactors = FALSE)

# 1. Port of embarkation
# Replace empty/missing values in the "embarked" column with S.
# Calling unique() on titanic$embarked reveals there are no NA values, only "", so replace "" with "S"
titanic$embarked[titanic$embarked == ""] <- "S"

# 2. Age
# Calculate the mean age
m_age <- na.omit(titanic$age) %>% mean() 

# Replace NA with the mean age
titanic$age[is.na(titanic$age)] <- m_age

# 3. Lifeboat
# Replace empty values in the boat column with the dummy variable "None"
titanic$boat[titanic$boat == ""] <- "None"

# 4. Cabin
# Create a dummy variable column that says whether or not a passenger has a cabin number
titanic <- titanic %>% mutate(has_cabin_number = ifelse(titanic$cabin == "", 0, 1))

# Save "clean" data set
write.csv(titanic, file = "titanic_clean.csv")
