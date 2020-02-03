library(tidyverse)
setwd("C:/Users/Kim F/Desktop/R&SQL_for_Business_Analytics/3. Zusammenfassungen & Guidelines/Ch. 3 Data Visualization with ggplot2")
getwd()

?iris
# the following plots using ggplot base on the 'iris' data frame
# iris is a special flower 

# plot with no data/observation displayed:
ggplot(iris, aes(Sepal.Length,Petal.Length))  # petal length [Länge d. Blütenblattes]
                                              # sepal length [weiterer botanischer Begriff: Länge d. Kelchblattes]

# basic plot each observation displayed as points (geom_point): 
ggplot(iris, aes(Sepal.Length,Petal.Length)) +
 geom_point()

head(iris) 
# looking at the table we see that there is a differentiation between species 
# we could therefore check whether the two groups visable in the plot are different species
# this can be done by mapping diff. colors to the species

ggplot(iris, aes(Sepal.Length,Petal.Length, colour= Species)) +
  geom_point()

# add pedal.width through size of the points: 
ggplot(iris, aes(Sepal.Length,Petal.Length, colour= Species, 
                 size=Petal.Width)) +
  geom_point()


# display differentiation between species further by shape:
ggplot(iris, aes(Sepal.Length,Petal.Length, colour= Species, 
                 size=Petal.Width, shape= Species)) +
  geom_point()

# alpha aesthetic: 
ggplot(iris, aes(Sepal.Length,Petal.Length, 
                 colour= Species, size=Petal.Width, shape= Species, alpha = Sepal.Length)) +
  geom_point()

# geom_bar: 
# bar-chart with 'count' stat (default)
ggplot(iris, aes(Species, Sepal.Length)) +
geom_bar()


# bar-chart with 'summary' stat  
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_bar(stat = "summary")

# bar-chart with 'summary' stat 'mean'& distinguish between species by color 
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_bar(stat = "summary", fun.y= "mean") # fun.y stands for function of y

# customize graph with variable-independent specifications, for example color of all bars
ggplot(iris, aes(Species, Sepal.Length)) +
           geom_bar(stat = "summary", fun.y= "mean", fill="yellow") 

# one can also use color-codes to define a specific color: 
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_bar(stat = "summary", fun.y= "mean", fill="indianred1")

# change only outline: color, size (for thickness of outline) & linetype 
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_bar(stat = "summary", fun.y= "mean", fill="indianred1", color="darkgreen", size=1, linetype= 2)

# add values: geom_point layer + jitter those values + change graphical parameters of points
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_bar(stat = "summary", fun.y= "mean", 
           fill="indianred1", color="darkgreen", size=1, linetype= 2) +
  geom_point(position = position_jitter(0.2), size=2, shape=12, color= "darkgreen"
             )

myfirstplot<-ggplot(iris, aes(Species, Sepal.Length)) +
  stat_summary(fun.y = "mean", geom = "bar", fill="black", color="green") +
  geom_point(position = position_jitter(0.2), size=2, shape=12, color= "darkgreen") +
  ggtitle("Kim")
  
myfirstplot + theme(panel.grid=element_blank()) # delete grid 
myfirstplot + theme_bw() + ggtitle ("myfirstplot") + theme(plot.title=element_text(hjust=0.5))
myfirstplot

# Boxplots
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_boxplot() + geom_point() + ggtitle("Boxplot") + theme 

# Note: Due to layering, the order matters
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_point() + geom_boxplot() + ggtitle("Boxplot") +
  labs(x = "Species", y="Sepal Length in mm") +
  theme 
head(iris)
??summary
