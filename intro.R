# ---------------------------------------------------------------------
# Program: intro.R
#  Author: Dan Martin
#    Date: Aug 7, 2014
#
# Note: most of this script was based off of Matt Keller's tutorial found here:
# http://psych.colorado.edu/~anre8906/docs/3101-01_intro.R 
#
# WELCOME TO THE WONDERFUL WORLD OF R!
#
# This is an introductory script for learning the very basics
#   of R.  This header is a comment.  Any text after a hash mark (#)
#   is ignored by R until the next carriage return.  So, if you
#   put a hash mark at the beginning of a line, the whole line
#   is ignored.
#
# This script is formatted for a text window that is 72 columns wide.
#
# As we go through this file, I encourage you to write your
#   own comments so that you can come back to this file and
#   remind yourself of what was happening. 
#
# I encourage you to make these comment notes in all of the scripts
#   in this workshop.  This makes it easier on you to read your own script!
#
# Last: ALWAYS ALWAY ALWAYS work from a script, and save your script
# This not only gives you a log of what you did, but also allows you
# to quickly be able to re-create your work from where you left off.
# ---------------------------------------------------------------------

# ---------------------------------------------------------------------
# PART 1: USING R AS A CALCULATOR
# ---------------------------------------------------------------------

# Arithmetic with two numbers

2+2

2-4

2*3

8/3

# If you're like me, you don't remember order of operations
9+12*3

# So use parentheses to be explicit about what you want!
(9+12)*3

# 3 squared
3^2

# 9 to the 1/2 power
9^.5

# That is the same as what is returned by the square root function
sqrt(9)

# A more complicated bit of algebra
(sqrt(9)-6^2)/4


# ---------------------------------------------------------------------
# PART 2: ASSIGNMENT AND OBJECT CREATION
# ---------------------------------------------------------------------

# Let's make a variable called Fred
Fred <- 2+2

# Congrats! You've just made your first variable.
# We say, "Fred gets two plus two". The arrow (less than, dash)
# "assigns" 2+2 to Fred. You'll use the "gets arrow" all the time!

# Type Fred on a line by itself and press return and you find out
# what is contained in Fred
Fred

# Caps matter. There is no object "fred". Your first error message!
fred

# Error messages are our friends :) They give us tough love.

# These are all equivalent
Fred + 3
4 + 3
Fred+3
4 +      3

# white space doesn't     matter     between      things, 
# but it does matter within t h i n g s
F r e d

# One variable can be assigned to another.
a <- Fred

# Now 'a' is a copy of Fred.
a

# We read the next line as "A gets square root of 'a' times five"
A <- sqrt(a)*5
A

# This one is a little tricky.  We can re-assign A.
A <- A*a
A

# Here, we create a vector of length 13; notice what ":" does
x2 <- 1:13
x2

# The "*" does element-wise multiplication.
x2*3


# Vectors can also be created by the "c()" function.
# "c" stands for "concatenate".
myvec <- c(8,13,2,1,6)
myvec

# If you wish to work with one of the numbers you can get access to it 
# using the variable and then square brackets indicating which number

myvec[1]
myvec[4]
myvec[6] # doesn't exist, but we can create it
myvec[6] <- 1
myvec

# There are different data types: numeric, character, factor, logical are a few
numericVector <- c(1, 2, 3, 4)
is.numeric(numericVector)
str(numericVector)

charVector <- c("A", "B", "C", "D")
is.numeric(charVector)
is.character(charVector)
str(charVector)

factVector <- as.factor(charVector)
is.character(factVector)
is.factor(factVector)
str(factVector)

logVector <- c(TRUE, FALSE, TRUE, TRUE)
is.logical(logVector)
str(logVector)

# ---------------------------------------------------------------------
# PART 3: FUNCTIONS
# ---------------------------------------------------------------------

# R is a very *functional* language. 
# Most of what you do in R is use functions.
# We've already seen a couple of functions. 
# Let's look more in depth:

# sqrt() is a "function" and the "argument" is 16.
sqrt(16)
sqrt(x = 16) # this is the same as above because the argument is named "x" for sqrt()

?sqrt # the help function tells you the first argument is "x". You can either
# be explicit and say sqrt(x=16) or not, sqrt(16), in which case R expects arguments
# to be given by you in order (here, there's just a single argument though)

# Functions take arguments, do something, and then return something.
# Every time you see a word followed by parentheses,
# you are seeing a function.

# This is the formal way to use functions.
# We can explicitly name the argument x.
sqrt(x = 16)

# Absolute value
abs(-7)

# The function c() [concatenate] makes vectors
c(3, -2, -3, 6, 1)

# We can use functions as arguments to other functions! Fun!
abs(c(3, -2, -3, 6, 1))

# Some functions require no input.
# This prints to screen every object we've created so far
# You can see these objects in the workspace window
ls()

# We can also remove objects we've created
# Let's delete Fred
rm(Fred)

# We can also clear our working directory. I recommend doing 
# this at the beginning of any R session
rm(list = ls())

# This function creates a vector of 50 pseudo random numbers 
# drawn from a normal distribution with mean = 0 and sd = 1
?rnorm
rnorm(n = 50, mean = 0, sd = 1.0)
hist(rnorm(n = 5000, sd = 1.0, mean = 0))

# Create *a different* vector of 50 values using rnorm
dat <- rnorm(50, mean = 0, sd = 1.0)
dat

# How long is dat?
length(dat)

# What is the mean of dat? Is it exactly 0? Why not?
mean(dat)

# What is the median of dat?
median(dat)

# What is the variance of dat?
var(dat)

# What is the standard deviation of dat?
sd(dat)

# Or, you could calculate standard deviation from the variance.
sqrt(var(dat))

range(dat)

min(dat)

max(dat)

# Create a five number summary of dat
summary(dat)


# ---------------------------------------------------------------------
# PART 4: CREATING DATASETS
# ---------------------------------------------------------------------


# a dataset is a matrix where rows are usually people (or the unit
# that we're interested in) and columns are variables that each person
# is measured on. Each cell has the score of that particular person and
# that particular variable.

# Let's make a dataset. There are 8 people measured on three variables
# So the dataset will have 8 rows and 3 columns.
# To start, we need to make 3 vectors, each of length 8:

# First variable is height
height <- c(68, 61, 63, 66, 64, 70, 69, 74)

# Next varible is weight
weight <- c(120, 168, 150, 112, 183, 155, 140, 227)

# Final variable is gender
gender <- c("F", "F", "F", "F", "M", "M", "M", "M")

# notice that when we enter numbers, we just enter the number, but
# when we enter a categorical variable like gender, we need to put
# the letters in quotes.
# This is because R tries to interpret letters or words - i.e., it tries
# to find an object named M, but if we put it in quotes, R knows that
# "M" is not an object, but a character

# So now look at our three vectors:
height
weight
gender

# Finally, we combine these into a dataset using the function below:
# cbind stands for "column bind", and cbind.data.frame combines
# the vectors to make a data frame
mydata <- cbind.data.frame(height, weight, gender)
?cbind

# If we want to add another column, e.g., names, we would do this:
names <- c("Jess", "Jen", "Jo", "Janet", "Mark", "Matt", "Mike", "Monty")
mydata.new <- cbind.data.frame(names, mydata)
mydata.new

# The top line along the dataset are the variable names

# Note: when you want to make a data frame, use cbind.data.frame, not cbind
# cbind will give you a matrix, which is a problem when you have
# some variables that are numbers and some that are characters

# To look at a variable in a dataframe, you can do it in one of two ways:
mydata[,1] # shows you the first variable, height, or
mydata$height # same thing

mean(mydata$height) # mean of height




