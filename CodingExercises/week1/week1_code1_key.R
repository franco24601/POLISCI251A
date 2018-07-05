###################
#  Class 2: Introduction to R
# POLISCI 251A
# Summer 2018
##################
  
### Estimated time: 30 min 

###Learning Objectives
# 1.Define the following terms as they relate to R: object, assign, call, function, arguments, options.
# 2. Assign values to objects in R.
# 3. Learn how to name objects
# 4. Use comments to inform script.
# 5. Solve simple arithmetic operations in R.
# 6. Call functions and use arguments to change their default options.
# 7. Inspect the content of vectors and manipulate their content.
# 8. Subset and extract values from vectors.
# 9. Analyze vectors with missing data.


#############################
#   Before we start
###########################

# Let's start with an empty working directory

rm(list = ls())   ### Remove all objects in the working environment
### Similar to "clear all" in Stata

##The working directory is an important concept to understand. 
## It is the place from where R will be looking for and saving the files. 
## When you write code for your project, it should refer to files in relation to the root of your working directory 
## and only need files within this structure.

## Using RStudio projects makes this easy and ensures that your working directory is set properly. 
## If you need to check it, you can use:
getwd()

#If for some reason your working directory is not what it should be, you can change it using:

setwd("YOUR PATH HERE")


#############################
#   Creating objects in R
###########################

#You can get output from R simply by typing math in the console:
  
3 + 5
12 / 7

#However, to do useful and interesting things, we need to assign values to objects. 
#To create an object, we need to give it a name followed by the assignment operator <-, 
## and the value we want to give it:
  
weight_kg <- 55

## Remember:
#In RStudio, typing Alt + - (push Alt at the same time as the - key) will write <- in a single keystroke in a PC, 
## while typing Option + - (push Option at the same time as the - key) does the same in a Mac.


#### Objects 
## When assigning a value to an object, R does not print anything. 
## You can force R to print the value by using parentheses or by typing the object name:

weight_kg <- 55    # doesn't print anything
(weight_kg <- 55)  # but putting parenthesis around the call prints the value of `weight_kg`
weight_kg          # and so does typing the name of the object

#Now that R has weight_kg in memory, we can do arithmetic with it. For instance, 
#we may want to convert this weight into pounds (weight in pounds is 2.2 times the weight in kg):
  
2.2 * weight_kg

#We can also change an object’s value by assigning it a new one:
  
weight_kg <- 57.5
2.2 * weight_kg

#This means that assigning a value to one object does not change the values of other objects 
# For example, let’s store the animal’s weight in pounds in a new object, weight_lb:
  
weight_lb <- 2.2 * weight_kg

##and then change weight_kg to 100.

weight_kg <- 100

#^^^^^^ Question: #^^^^^^
##What do you think is the current content of the object weight_lb? 126.5 or 220?
## Answer 126.5
## Challenge
# What are the values after each statement in the following?
mass <- 47.5            # mass?
age  <- 122             # age?
mass <- mass * 2.0      # mass?
age  <- age - 20        # age?
mass_index <- mass/age  # mass_index?

#############################
#  Functions and their arguments
###########################

## Functions are “canned scripts” that automate more complicated sets of commands
## including operations assignments, etc. Many functions are predefined, 
## or can be made available by importing R packages (more on that later).

## A function usually gets one or more inputs called arguments. 
## Functions often (but not always) return a value. 
## A typical example would be the function sqrt(). T
## The input (the argument) must be a number, and the return value 
## (in fact, the output) is the square root of that number. 
## Executing a function (‘running it’) is called calling the function. 
## An example of a function call is:

b <- sqrt(2)

#^^^^^^ Question: #^^^^^^
## What is the value of b?
#^^^^^^ Type your answer here ^^^^^^
## Answer: 1.414214

## Arguments can be anything, not only numbers or filenames, 
## but also other objects. Exactly what each argument means differs per function, 
## and must be looked up in the documentation (see below). 
## Some functions take arguments which may either be specified by the user, or, if left out, 
## take on a default value: these are called options. 

## Let’s try a function that can take multiple arguments: round().

round(3.14159)

## Here, we’ve called round() with just one argument, 3.14159, 
## and it has returned the value 3. 
## That’s because the default is to round to the nearest whole number. 

#^^^^^^ Exercise: #^^^^^^
## Now, let's use some of the arguments of round() to get a different numer of digits
## Take a look to the round() function in the Help window or type ?round
## How can you change the default arguments? 
## Use the round function with the number 3.14159 to round it to two digits, that is 3.14
#^^^^^^ Type your answer here ^^^^^^
round(3.14159, digits=2)

## Note that If you provide the arguments in the exact same order as they are defined you don’t have to name them:
round(3.14159, 2)
## And if you do name the arguments, you can switch their order:
round(digits = 2, x = 3.14159)


#############################
#   Vectors and data types 
###########################

## A vector is the most common and basic data type in R, and is pretty much the workhorse of R. 
## A vector is composed by a series of values, which can be either numbers or characters. 
## We can assign a series of values to a vector using the c() function. 
## For example we can create a vector of wages and assign it to a new object wages_g:

wages_g <- c(5000, 6000, 6500, 8200)
wages_g

## A vector can also contain characters:
countries <- c("mexico", "sweden", "germany", "korea")
countries

## The quotes around “mexico”, “germany”, etc. are essential here. 
## Without the quotes R will assume there are objects called mouse, rat and dog

## There are many functions that allow you to inspect the content of a vector. 
## length() tells you how many elements are in a particular vector:
length(wages_g)
length(countries)

## An important feature of a vector, is that all of the elements are the same type of data. 
## The function class() indicates the class (the type of element) of an object:
class(wages_g)
class(countries)

## You can use the c() function to add other elements to your vector:
wages_g <- c(wages_g, 20000) # add to the end of the vector
wages_g <- c(30000, wages_g) # add to the beginning of the vector
wages_g

## In the first line, we take the original vector wages_g, 
## add the value 20000 to the end of it, and save the result back into wages_g. 
## Then we add the value 30000 to the beginning, again saving the result back into wages_g.

## We can do this over and over again to grow a vector, or assemble a dataset. 
## As we program, this may be useful to add results that we are collecting or calculating.

## An atomic vector is the simplest R data type and is a linear vector of a single type. 
## Above, we saw 2 of the 6 main atomic vector types that R uses: "character" and "numeric" (or "double"). 
## Another important atomic vector type are called "logical" and take values TRUE and FALSE (the boolean data type)

#^^^^^^ CHALLENGE ^^^^^^
## We’ve seen that atomic vectors can be of type character, numeric (or double), integer, and logical. 
## But what happens if we try to mix these types in a single vector?
# What will happen in each of these examples? 
## (hint: use class() to check the data type of your objects):
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

class(num_char) #All characters transformed to character
class(num_logical) # All characters transformed to numeric
class(char_logical) #All characters transformed to character
class(tricky) #All characters transformed to character

#Why do you think it happens?
#^^^^^^ Answer ^^^^^^
## Vectors can be of only one data type. 
## R tries to convert (coerce) the content of this vector to find a “common denominator” 
## that doesn’t lose any information.



#^^^^^^ STOP ^^^^^^


#############################
#   Subsetting vectors 
###########################

## If we want to extract one or several values from a vector, we must provide one 
## or several indices in square brackets. For instance:
schools <- c("stanford", "harvard", "princeton", "yale")
schools[2]
schools[c(3, 2)]

#^^^^^^ Exercise ^^^^^^
## Using these tools reate an object called top_two containing only "stanford" and "harvard"
#^^^^^^ Type your answer here ^^^^^^
top_two <- schools[c(1, 2)]

#^^^^^^ NOTE ^^^^^^
## R indices start at 1. Programming languages like Fortran, MATLAB, Julia, and R start counting at 1,
## because that’s what human beings typically do. Languages in the C family (including C++, Java, Perl, and Python) 
## count from 0 because that’s simpler for computers to do.

###Conditional subsetting

## Another common way of subsetting is by using a logical vector. 
## TRUE will select the element with the same index, while FALSE will not:
weight_g <- c(21, 34, 39, 54, 55)
weight_g[c(TRUE, FALSE, TRUE, TRUE, FALSE)]

##Typically, these logical vectors are not typed by hand, 
## but are the output of other functions or logical tests. 
## For instance, if you wanted to select only the values above 50:

weight_g > 50    # will return logicals with TRUE for the indices that meet the condition

## so we can use this to select only the values above 50
weight_g[weight_g > 50]

## You can combine multiple tests using & (both conditions are true, AND) 
## or | (at least one of the conditions is true, OR):
weight_g[weight_g < 30 | weight_g > 50]

#^^^^^^ Exercise ^^^^^^
## Using this tools obtain the values from vector weight_g that are larger than 50
## and lower or equal than 35
#^^^^^^ Type your answer here ^^^^^^
weight_g[weight_g <= 35 | weight_g > 50]

#^^^^^^ NOTE ^^^^^^
## Here, < stands for “less than”, > for “greater than”, >= for “greater than or equal to”, and == for “equal to”. 
## The double equal sign == is a test for numerical equality between the left and right hand sides, and should not 
## be confused with the single = sign, which performs variable assignment (similar to <-).


#^^^^^^ STOP ^^^^^^

#############################
#   Missing data 
###########################

## As R was designed to analyze datasets, it includes the concept of missing data (which is uncommon in other programming languages).
## Missing data are represented in vectors as NA.

## When doing operations on numbers, most functions will return NA if the data you are working with include missing values. 
## This feature makes it harder to overlook the cases where you are dealing with missing data. You can add the argument 
## na.rm=TRUE to calculate the result while ignoring the missing values.

heights <- c(2, 4, 4, NA, 6)
mean(heights)
max(heights)
mean(heights, na.rm = TRUE)
max(heights, na.rm = TRUE)

## If your data include missing values, you may want to become familiar with the functions is.na(), na.omit(), and complete.cases(). 
## See below for examples.

## Extract those elements which are not missing values.
heights[!is.na(heights)]

## Returns the object with incomplete cases removed. The returned object is an atomic vector of type `"numeric"` (or `"double"`).
na.omit(heights)

## Extract those elements which are complete cases. The returned object is an atomic vector of type `"numeric"` (or `"double"`).
heights[complete.cases(heights)]

#^^^^^^ Challenge ^^^^^^
#Using this vector of heights in inches, create a new vector with the NAs removed.
heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)

#^^^^^^ Answer ^^^^^^
heights_no_na <- heights[!is.na(heights)] 
# or
heights_no_na <- na.omit(heights)

## Use the function median() to calculate the median of the heights vector.
#^^^^^^ Answer ^^^^^^
median(heights, na.rm = TRUE)

## Use R to figure out how many people in the set are taller than 67 inches.
#^^^^^^ Answer ^^^^^^
heights_above_67 <- heights_no_na[heights_no_na > 67]
length(heights_above_67)




############################################################################
### NOTE: Part of this script was taken from: http://www.datacarpentry.org/R-ecology-lesson/01-intro-to-r.html