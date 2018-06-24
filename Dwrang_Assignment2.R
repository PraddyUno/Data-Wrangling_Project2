# Install dplyr package
install.packages("dplyr")

library(dplyr)
# 0.
# Read the csv file
# Note following command creats a data frame - check with class(dft)
# Replace all missing values with NA

dft<- read.csv("titanic_original.csv",header= TRUE, na.strings = c("","na"))

# 1.
# Port of Embarkation: Replacing missing values with "S"
# Steps:
#1. query the missin values - "NA" as replaced missing entires in first step
#2. replace the NA values with "S" in dtf$embarked

dft$embarked <- replace(dft$embarked, which(is.na(dft$embarked)), "S")

# 2.
# Missing Age values
# Replacing missing values with mean of existing values in dft$age
dft$age <- replace(dft$age, which(is.na(dft$age)), mean(dft$age,na.rm=TRUE))

# ####
# Another way to populate is to compute the mean of Male and Females separetely and fill
# the missing information accordingly
# ####

# 3.
# Lifeboat
# All missing values where replaced by NA when loading the csv file

# 4.
# Cabin
# Missin cabin numbers might be assoiated for the workers on the ship
# New column with (0,1)
dft <- dft %>% mutate(has_cabin_number = ifelse(is.na(cabin),0,1))

#5.
# Save results in new csv file
write.csv(dft, file = "titanic_clean.csv")