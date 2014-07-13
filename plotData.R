# ---------------------------------------------------------------------
# Program: cleanData.R
#  Author: Dan Martin
#    Date: Aug 7, 2014
#
# This script will give an overview of ggplot2 to create publishable
# graphics 

rm(list = ls())

# ---------------------------------------------------------------------
# PART 1: BASE GRAPHICS
# ---------------------------------------------------------------------

# Base graphics come standard in R, and are nice for simple tasks like
# histograms and scatterplots

myData <- iris # comes with R

hist(myData$Sepal.Length)
hist(myData$Sepal.Width, main = "This is a histogram")

pairs(myData)
pairs(myData[, -5])

# Helps files are a great source of code too!
# P.S. I know it looks like gibberish, it doesn't matter.
# We just want what is under the hood
?pairs

## put histograms on the diagonal
panel.hist <- function(x, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5) )
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks; nB <- length(breaks)
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, col = "cyan", ...)
}

## put (absolute) correlations on the upper panels,
## with size proportional to the correlations.

panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y))
  txt <- format(c(r, 0.123456789), digits = digits)[1]
  txt <- paste0(prefix, txt)
  if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor * r)
}

pairs(myData[, -5], upper.panel = panel.cor, panel = panel.smooth, diag.panel = panel.hist,)

# ---------------------------------------------------------------------
# PART 2: GGPLOT2
# ---------------------------------------------------------------------

# Base graphics are nice, but they can get a little difficult for more
# complex graphs. To have more flexibility, we will move to ggplot2

require(ggplot2)

# Here is a great resourse for ggplot2 from his creator: http://docs.ggplot2.org/current/

# ggplot is like an onion, it's made of layers

# All ggplot2 plots begin with the function ggplot(). It takes two primary arguments:
# 1. data - the dataframe with the data to be plotted
# 2. aes - the aesthetic mappings (i.e., x and y, group, etc.)

# Then, all we need to do is add whatever layers we want!
  
?mpg
summary(mpg)

p <- ggplot(mpg, aes(x = displ, y = hwy))
p

# We need to add layers, like geom_point or geom_line

p + geom_point()

p + geom_line()

p + geom_point() + geom_line()

# We can also color the points or lines by adding an aes argument

p + geom_point(aes(color = factor(cyl)))

p + geom_line(aes(color = factor(cyl)))


# A nice thing is also plotting smoothing lines, by group, with the data

ggplot(mpg, aes(displ, hwy, color = factor(cyl))) + geom_point() + stat_smooth(method = "lm")

ggplot(mpg, aes(displ, hwy, color = factor(cyl))) + geom_point() + stat_smooth(method = "loess")

# Another option is to facet by a categorical variable. That is, plot the same thing for 
# different individuals, or difficult schools, etc.

ggplot(mpg, aes(displ, hwy)) + geom_point() + stat_smooth(method = "loess") + facet_grid(. ~ cyl)

# That looks kind of bad, let's change the scale (BE CAREFUL WITH THIS, IT CAN BE MISLEADING)

ggplot(mtcars, aes(mpg, wt, colour = factor(cyl))) + geom_point() + facet_grid(. ~ cyl, scales = "free")

# We can also change font size, background color, etc.

q <- ggplot(mpg, aes(displ, hwy, color = factor(cyl))) + geom_point() 

# Add in white backgroup

q + theme_bw()

# Make larger points

q + geom_point(size = 3)

# Or larger lines

q + stat_smooth(method = "lm", size = 3)

# Larger lines with no standard errors

q + stat_smooth(method = "lm", size = 3, se = FALSE)

# Add a title

q + ggtitle("This is a title")

# Change the labels

q + labs(x = "x-axis", y = "y-axis")

# Change the font size

q + theme(text = element_text(size=20))

