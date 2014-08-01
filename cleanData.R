# ---------------------------------------------------------------------
# Program: cleanData.R
#  Author: Dan Martin
#    Date: Aug 7, 2014
#
# This script will outline popular tools in R to clean your datasets

rm(list = ls())

# ---------------------------------------------------------------------
# PART 1: SETTING THE DIRECTORY
# ---------------------------------------------------------------------

# Setting the working directory let's R know where our scripts R and
# where to keep anything we try to save. This differs depending upon
# whether you have a Mac or a PC.

# For Mac: setwd("~/Desktop)
# For PC:  setwd("c:/Desktop")

# RStudio makes this much easier:
# 1. Click the files tab
# 2. Navigate to the folder you want your working directory
# 3. Click More -> Set As Working Directory
# 4. Copy and paste the code into your script so you have it for later

# ---------------------------------------------------------------------
# PART 2: INSTALLING PACKAGES
# ---------------------------------------------------------------------

# R Packages make our lives a lot easier. They are compiled functions
# that other R users have already made, and that we are free to use.
# There are well over 5000 packages publicly available on CRAN.

# Installing packages is as easy as using the install.packages()
# function. Just put the package name in quotes.

install.packages("car") # for recoding variables

# Once we install the relevant packages, we need to import them in
# to our workspace using either the require() or library() function

require(car)

# ---------------------------------------------------------------------
# PART 3: READING IN AND EXAMINING DATA
# ---------------------------------------------------------------------

# Let's see if there is a dataset we can read in our working directory

list.files()

# You should see an iris.csv if you set your working directory correctly.
# We can read this in using the read.csv function

?read.csv

myData <- read.csv("iris.csv", header = TRUE)
class(myData)

# Print the dataset

myData

# This is a bad idea, especially with large datasets. Let's just look at
# a snippet

head(myData)
tail(myData)

# How can we get it to print more rows?

?head

# Get summaries of all the variables across the entire sample

summary(myData)

# Let's examine the structure of the dataset

str(myData)


# ---------------------------------------------------------------------
# PART 4: CLEANING DATA
# ---------------------------------------------------------------------

# Let's say we don't like how Species is coded. We can change that
# using the Recode function in the car package

?Recode

Recode(myData$Species, "'setosa' = 'set'; 'versicolor' = 'vers'; 'virginica' = 'virg'",
       as.factor.result = TRUE)

# Remember, we need to save over the other variable 
# (I don't recommend this, you should always create a new one)

myData$Species <- Recode(myData$Species, "'setosa' = 'set'; 'versicolor' = 'vers'; 'virginica' = 'virg'",
                         as.factor.result = TRUE)

head(myData)

# We can also define new variables. Let's assume sepal is a square, 
# and define sepal.area as sepal.length * sepal.width

myData$Sepal.Area <- myData$Sepal.Length * myData$Sepal.Width

# You can use a shortcut with the with statement to make the writing
# shorter

sameArea <- with(myData, Sepal.Length * Sepal.Width)
identical(myData$Sepal.Area, sameArea)

# Let's create another dataset that includes
# a correponsing color for each species.
# Assume a 1-1 correspondence betweeen
# specied and color

speciesColor <- data.frame(Species = c('set', 'vers', 'virg'),
                           Color = c('red', 'blue', 'green'))
speciesColor

# We can merge color into our iris dataset using the merge function

newData <- merge(myData, speciesColor, by = "Species")
summary(newData)

# ---------------------------------------------------------------------
# PART 4: TIDYING DATA
# ---------------------------------------------------------------------

# This section will cover cleaning data in the context of Hadley Wickham's
# tidy data paper (http://vita.had.co.nz/papers/tidy-data.pdf) 
# and dplyr package

# install.packages('dplyr')
require(dplyr)

(df <- tbl_df(iris))

class(df)

# dplyr has 5 main functions: filter, select, arrange, mutate, and summarise

######################################
# filter: keep rows matching criteria

# Select row values:

df[df$Species == 'setosa', ]

# Using filter intead: 

filter(df, Species == 'setosa')

######################################
# select: pick columns by name

# Select columns:

df[, c("Sepal.Width", "Species")]

# Using select:

select(df, c(Sepal.Width, Species))
select(df, c(Sepal.Width:Species))
select(df, -c(Sepal.Width:Species))

######################################
# arrange: reorder rows

# Reorder rows

df[order(df$Sepal.Length), ]
df[order(df$Sepal.Length, df$Petal.Length), ]

# Using arrange:

arrange(df, Sepal.Length)
arrange(df, Sepal.Length, Petal.Length)
arrange(df, desc(Sepal.Length))

######################################
# mutate: add new variables

df$sum1 <- df$Sepal.Length + df$Sepal.Width
df$sum1 <- with(df, Sepal.Length + Sepal.Width)
  
mutate(df, sum2 = Sepal.Length + Sepal.Width)

######################################
# summarise: reduce variables to values

by_Species <- group_by(df, Species)

summarise(by_Species,
          Sepal.Length_mean = mean(Sepal.Length),
          Sepal.Width_mean = mean(Sepal.Width))

#######################################
# pipes: connecting dplyr functions

# Let's filter df so we only have flowers with > 6 Sepal.Length and > 3 Sepal.Width
# Then, we want to get the mean of these flowers' Sepal.Length by Species

# One way

summarise(
  group_by(
    filter(df, Sepal.Length > 6, Sepal.Width > 3),
    Species),
  Sepal.Length_mean = mean(Sepal.Length)
)

# OR use the pipe operator (%>%) - read it as "then"
# x %>% f(y) -> f(x, y)

filter(df, Sepal.Length > 6, Sepal.Width > 3) %>%
  group_by(Species) %>%
  summarise(Sepal.Length_mean = mean(Sepal.Length))



