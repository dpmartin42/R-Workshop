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

# We can also create data summaries by group if we would like 

# install.packages("doBy")
require(doBy)

summaryBy(Sepal.Length ~ Species, data = myData, FUN = c(mean, sd))





