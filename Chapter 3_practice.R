library(tidyverse)
setwd("C:/Users/Kim F/Desktop/Semester 1/R&SQL_for_Business_Analytics/3. Zusammenfassungen & Guidelines/Ch._3_Data Visualization with ggplot2")

# ?mpg
# head(mpg)

## p.22: Does the size of an engine influence fuel consumption? 
# displ = engine displacement, in litres; cty = city miles per gallon

#1): with linear regression model 
ggplot(data=mpg, aes(displ, cty))+
geom_point()+ 
geom_smooth(method=lm, color = "red", fill= "grey", size= 1)

#2): with Loess Curve Fitting (Local Polynomial Regression); 
# This is a method for fitting a smooth curve between two variables

ggplot(data=mpg, aes(displ, cty))+
  geom_point()+
  geom_boxplot(aes(group=displ))+
  geom_smooth()

## p. 24, exercises 3.2.4
# Exercise 1:
ggplot(data=mpg)
#Exercise 2: # over rows and columns (=variables)
?mpg
nrow(mpg)
ncol(mpg)
# Exercise 3: what does drv variable describe? 
# use ?mpg

# Exercise 4: make scatterplot w/ hwy vs. cyl 

ggplot(data=mpg, aes(cyl, hwy, size = cyl))+
  geom_point()

# Exercise 5: scatterplot of class vs. drv. why is scatterplot not useful?
ggplot(data=mpg, aes(class, drv)) +
geom_point()
# the scatterplot is not useful because both, class and drv are categorical variables (kategoriale Variablen)
# kategoriale Variablen sind nicht-numerische Variablen mit begrenzter Anzahl an Ausprägungen
# we plot the same combination of attributes of variables class & drv multiple times
# the dots are layered on top of each other, so that we basically only see the 
# combinations of attributes given in the dataset

## p. 25 try to explain outliers by adding aesthetics: 

ggplot(data=mpg, aes(displ, hwy)) + 
  geom_point()
# one can see from the plot, that there are 6 outliers, coming w/ a high hwy rel. to displ
# hypothesis: those cars might be hybrids
# test: map "class" variable to see if that is the case
ggplot(data=mpg, aes(displ, hwy, color=class)) + 
  geom_point()

# the scatter plot w/ color asthetic mapping to var. class reveals that many of the 
# outliers are sports cars (2seaters) not hybrids
# --> sports cars w/ large engines but small bodies have better gas mileage

# caution w/ shape asthetic: R can only use 6 shapes at a time
# thus don't use it for variables w/ > 6 attributes 
# e.g. class, which has 7 attributes
ggplot(data=mpg, aes(displ, hwy, shape=class)) + 
  geom_point()

## p.29 Exercises 3.3.1
# Exercise 1: Why are colors of points are not changing to blue in the following code: 

ggplot(data =mpg)+
  geom_point(mapping = aes(x=displ, y=hwy, color="blue"))

# what happens here is that we map the color aesthetic to a newly created variable 
# "blue"; thus all the points in the plot are now only named "blue" 

#Exercise 2: Which variables in mpg are categorical? Which variables are continuous? 
# (Hint: type ?mpg to read the documentation for the dataset). 
# How can you see this information when you run mpg ?

# -> categorical variables: manufacturer, model, trans (type of transmission)
#                           drv (drive), fl (fuel type), class ("type of car")
# -> continuous variables: year, cyl, cty (city miles per gallon), hwy (highway miles per gallon), 
                          # displ (engine displacement, in litres)

# in R all categorical variables are of the datatype "character"
# thus rather than using ?mpg one can also run mpg; right above the values 
# the datatype of a variable is always stated

# Exercise 3: Map a continuous variable to color, size and shape. How do these aesthetics 
# behave differently for categorical vs. continuous variables?

# 1) Aesthetic mapping w/ continuous variable hwy
ggplot(data = mpg, aes(drv, hwy, color = hwy)) + 
  geom_point()

#-> instead of using distinct colors, for continuous variables a scale is used 

ggplot(data = mpg, aes(drv, hwy, size = hwy)) + 
  geom_point()
#-> size varies for each diff. value, although legend only shows a few representative ones

ggplot(data = mpg, aes(drv, hwy, shape = hwy)) + 
  geom_point()
 # R returns an error -> continuous variable can of course not be mapped to shape

#2) Aesthetic mapping w/ categorical variable class
ggplot(data = mpg, aes(drv, hwy, color = class)) + 
  geom_point()


ggplot(data = mpg, aes(drv, hwy, size = class)) + 
  geom_point()

ggplot(data = mpg, aes(drv, hwy, shape = class)) + 
  geom_point()

# Exercise 5: What does the stroke aesthetic do? What shapes does it work with? 
# (Hint: use ? geom_point )

ggplot(data = mpg, aes(drv, hwy)) + 
  geom_point(shape = 24, stroke = 5)

# Exercise 6: 6. What happens if you map an aesthetic to something other than a 
# variable name, like aes(colour = displ < 5) ?

ggplot(data = mpg, aes(class, hwy, color = displ < 5)) +
         geom_point()

##p. 31 ff.: Facting
# p. 31: faceting using a single variable 
ggplot(data=mpg, aes(displ, cty))+
  geom_point()+
  facet_wrap(~ class)

# p. 31: faceting using a single variable & specification w/ nrow
ggplot(data=mpg, aes(displ, cty))+
  geom_point()+
  facet_wrap(~ class, nrow=2)

# p. 31: faceting using a single variable & specification w/ nrow
ggplot(data=mpg, aes(displ, cty))+
  geom_point()+
  facet_wrap(~ class, ncol=2)

# p.32: faceting using 2 diff. variables: 
ggplot(data=mpg, aes(displ, cty))+
  geom_point()+
  facet_grid(drv~class)

# p. 32: faceting with rows (<VARIABLE>~.) or columns (.~<VARIABLE) only 
#classes as rows only/ no spreading over several columns
ggplot(data=mpg, aes(displ, cty))+
  geom_point()+
  facet_grid(class~.)

# classes as columns only/ no spreading over several rows
ggplot(data=mpg, aes(displ, cty))+
  geom_point()+
  facet_grid(.~class)

## p. 33 f. Exercises 3.5.1:
# Exercise 1: What happens if you facet on a continuous variable?
ggplot(data=mpg, aes(displ, cty))+
  geom_point()+
  facet_wrap(~ hwy, ncol=2)

ggplot(data=mpg, aes(drv, cyl))+
         geom_point()

## smooth Function + "linetype" aesthetic mapping + color aesthetic, 
# + geom_point + color aesthetic

ggplot(data=mpg, aes(displ, hwy))+
  geom_smooth(aes(linetype= drv, color=drv))+
  geom_point(aes(color = drv))

## smooth Function applied to only a subset: 
ggplot(data=mpg, aes(displ, hwy))+ 
  geom_point(aes(color=class))+
  geom_smooth(data=filter(mpg, class== "subcompact"), se = FALSE)

## p. 39, Exercise: 3.6.1: 
# Exercise 1: What geom would you use to draw a line chart? A boxplot? A histogram? 
# An area chart?

ggplot(data=mpg, aes(displ))+
  geom_histogram() 

# Exercise 2: 2. Run this code in your head and predict what the output 
# will look like. Then, run the code in R and check your predictions.

ggplot(data = mpg, aes(displ, hwy)) +
geom_point(aes(color=drv), show.legend=FALSE) +
  geom_smooth(se = FALSE) 

# Exercise 6: Recreate the code necessary to generate the following graphs:
# 1. graph: geom_point w/ increased dots in size + geom_smooth w/out standard error
# and increased in size as well

ggplot(data=mpg, aes(displ, hwy))+
  geom_point(size=4)+
  geom_smooth(se=FALSE, size=2)

# 2. graph: same as graph 1 but 3 smoothing lines instead of only one 
# there is only one variable that comes with 3 attributes only, which is "drv"
ggplot(data=mpg, aes(displ, hwy))+
  geom_point(size=4)+
  geom_smooth(aes(group= drv), se=FALSE, size=2)

# 3. graph: same as graph 2 but with color differentiation 
ggplot(data=mpg, aes(displ, hwy, color=drv))+
  geom_point(size=4)+
  geom_smooth(se=FALSE, size=2)

# 4. graph: color diff. for points, but only one smoothing line
ggplot(data=mpg, aes(displ, hwy))+
  geom_point(aes(color=drv), size=4)+
  geom_smooth(se=FALSE, size=2)

# 5. graph: same as graph 4, but with diff. linetypes for geom_smooth:
ggplot(data=mpg, aes(displ, hwy))+
  geom_point(aes(color=drv), size=4)+
  geom_smooth(aes(linetype=drv), se=FALSE, size=2)

# 6. graph: geom_point only, but with white outlines of points:
# use shape 21 for geom_point and adjust fill as well as color (outline)
ggplot(data=mpg, aes(displ, hwy, fill=drv))+
  geom_point(color="white", shape=21, size=3)

# p. 42 geom_function & stat_function can be used interchangebly to create same default 
# plot

# e.g. create frequency bar chart with geom_bar function using stat count as default: 
ggplot(data=mpg, aes(class))+
geom_bar()

# e.g. create frequency bar chart with stat_count function using geom = bar as default:
ggplot(data=mpg, aes(class))+
  stat_count()

ggplot(data=mpg, aes(class))+
  geom_bar(aes(x=class, y=..prop.., group=0))

## p. 45: Exercise 3.7.1 
# Exercise 1: 1. What is the default geom associated with stat_summary() ? 
# How could you rewrite the previous plot to use that geom function 
# instead of the stat function?

?stat_summary 
# -> default geom is "pointrange"

ggplot(data = diamonds, aes(cut, depth)) +
  stat_summary(fun.ymin=min, fun.ymax=max, fun.y=median)
# fun.ymin / fun.xmax plots min and max of y 

  ggplot(data=diamonds, aes(cut, depth)) +
    geom_pointrange(fun.ymin=min, fun.ymax=max, stat="summary", fun.y="median")
?geom_pointrange
  
# Exercise 2: What does geom_col do?
  ggplot(data=mpg, aes(class, hwy))+
    geom_col()

  ggplot(data=mpg, aes(class))+
    geom_bar()
  
?stat_smooth
  
## p. 47 geom_bar & map fill aesthetic against variable:
  
  ggplot(data=diamonds, aes(cut))+
    geom_bar(aes(fill=clarity))

## p. 50 Jitter 
  
  ggplot(data =mpg, aes (displ, hwy))+
    geom_point(position = "jitter")
  
# or: 
  ggplot(data =mpg, aes (displ, hwy))+
    geom_point()+
    geom_jitter(width=0.1, height=0.1)

## p. 50, Exercise 3.8.1:

# Exercise 1:What is the problem with this plot? How could you improve it?
  ggplot(data=mpg, aes(cty, hwy))+
    geom_point()
  # the problem with this plot is overplotting
  
  # Improvement through jittering 

  ggplot(data=mpg, aes(cty, hwy))+
    geom_point()+
    geom_jitter(width=0.5, height=0.5)
  
# Exercise 3: Compare geom_jitter with geom_count:
  ggplot(data=mpg, aes(class, hwy))+
    geom_point()+ geom_count() 

# Exercise 4: What's the default position adjustment for geom_boxplot() ? 
  # Create a visualisation of the mpg dataset that demonstrates it.
  
  ?geom_boxplot
ggplot(data=mpg, aes(class, cty, color=drv), group=0)+
  geom_boxplot(position="identity")

ggplot(data=mpg, aes(class, cty, color=drv), group=0)+
  geom_boxplot(position="dodge")

## p. 51: switching axes in a boxplot
ggplot(data = mpg,aes(class,hwy))+
  geom_boxplot()+
  coord_flip()
  