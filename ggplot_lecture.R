setwd("C:/Users/Kim F/Desktop/Semester 1/R&SQL_for_Business_Analytics/3. Zusammenfassungen & Guidelines/Ch._3_Data Visualization with ggplot2")

# ggplot Session 2
library(tidyverse)
ggplot(data = Canteen_clean) +
  geom_point(mapping = aes(x = Weekday, y = sumLillebuffet))

ggplot(data = Canteen_clean) +
  geom_point(mapping = aes(x = sumLillebuffet, y = sumStorBuffet))

ggplot(data = Canteen_clean) +
  geom_point(mapping = aes(x = sumLillebuffet, y = sumStorBuffet, color = Weekday))  

ggplot(data = Canteen_clean) +
  geom_point(mapping = aes(x = sumLillebuffet, y = sumStorBuffet), color = "blue")  

ggplot(data = Canteen_clean) +
  geom_point(mapping = aes(x = sumLillebuffet, y = sumStorBuffet, alpha = Weekday))  

ggplot(data = Canteen_clean) +
  geom_point(mapping = aes(x = sumLillebuffet, y = sumStorBuffet)) +
  facet_wrap(~ Weekday, nrow = 1)

ggplot(data = Canteen_clean) +
  geom_point(mapping = aes(x = sumLillebuffet, y = sumStorBuffet)) +
  facet_grid(Weekday ~ daytype)

ggplot(data = Canteen_clean) +
  geom_point(mapping = aes(x = sumLillebuffet, y = sumStorBuffet)) +
  facet_grid(. ~ daytype)

ggplot(data = Canteen_clean) +
  geom_point(mapping = aes(x = sumLillebuffet, y = sumStorBuffet)) +
  facet_grid(Weekday ~ .)


ggplot(data = Canteen_clean) +
  geom_point(mapping = aes(x = sumLillebuffet, y = sumStorBuffet))

ggplot(data = Canteen_clean) +
  geom_smooth(mapping = aes(x = sumLillebuffet, y = sumStorBuffet))

ggplot(data = Canteen_clean) +
  geom_point(mapping = aes(x = sumLillebuffet, y = sumStorBuffet)) +
  geom_smooth(mapping = aes(x = sumLillebuffet, y = sumStorBuffet))


ggplot(data = Canteen_clean) +
  geom_smooth(mapping = aes(x = sumLillebuffet, y = sumStorBuffet, 
                            linetype = daytype))
ggplot(data = Canteen_clean) +
  geom_smooth(mapping = aes(x = sumLillebuffet, y = sumStorBuffet, 
                            linetype = daytype), show.legend = FALSE)

ggplot(data = Canteen_clean) +
  geom_smooth(mapping = aes(x = sumLillebuffet, y = sumStorBuffet, 
                            linetype = daytype, color = daytype))



ggplot(data = Canteen_clean) +
  geom_point(mapping = aes(x = sumLillebuffet, y = sumStorBuffet)) +
  geom_smooth(mapping = aes(x = sumLillebuffet, y = sumStorBuffet, 
                            color = daytype), show.legend = FALSE)  

ggplot(data = Canteen_clean, mapping = aes(x = sumLillebuffet, 
                                           y = sumStorBuffet, color = daytype)) +
  geom_point(show.legend = FALSE) +
  geom_smooth(show.legend = FALSE)



ggplot(data = Canteen_clean, mapping = aes(x = sumtotprice, 
                                           y = sumSodavand, color = daytype)) +
  geom_point(mapping = aes(color = daytype)) +
  geom_smooth()


ggplot(data = Canteen_clean, 
       mapping = aes(x = sumtotprice, 
                     y = sumSodavand, color = daytype)) +
  geom_point() +
  geom_smooth()

ggplot(data = filter(Canteen_clean, sumtotprice > 1000), 
       mapping = aes(x = sumtotprice, 
                     y = sumSodavand, color = daytype)) +
  geom_point() +
  geom_smooth()






#Overriding the default stat - not counts but real values of the variables

ggplot(data = Canteen_data_inRformat001) + 
  geom_bar(mapping = aes(x = Department)) +
  coord_flip()

ggplot(data = Canteen_data_inRformat001) + 
  geom_bar(mapping = aes(x = Department, y = total), stat = "identity") +
  coord_flip()

ggplot(data = Canteen_data_inRformat001) + 
  geom_bar(mapping = aes(x = Department, y = total/count), stat = "identity") +
  coord_flip()

?ggplot2

#Overriding the default mapping from transformed variables to aesthetics
ggplot(data = Canteen_clean) + 
  geom_bar(mapping = aes(x = daytype)) +
  coord_flip()

ggplot(data = Canteen_clean) + 
  geom_bar(mapping = aes(x = daytype, y = ..prop.., group = 1)) +
  coord_flip()

#More attention to statistical transformation 
ggplot(data = filter(Canteen_clean, sumSodavand > 20)) + 
  stat_summary(
    mapping = aes(x = Weekday, y = sumSodavand),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )


ggplot(data = Canteen_clean) + 
  geom_bar(mapping = aes(x = daytype, colour = daytype)) #+
#    coord_flip()

ggplot(data = Canteen_clean) + 
  geom_bar(mapping = aes(x = daytype, fill = daytype)) #+
#   coord_flip()

#If you map the FILL aesthetics to another variable, then the bars are
#automatically stacked
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

ggplot(data = Canteen_clean) + 
  geom_bar(mapping = aes(x = daytype, fill = Weekday)) +
  coord_flip()


#position = "fill" works like stacking, but makes each set of stacked bars 
#the same height:

ggplot(data = Canteen_clean) + 
  geom_bar(mapping = aes(x = daytype, fill = Weekday), position = "fill") +
  coord_flip()

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")


#position = "dodge" places overlapping objects directly beside one another. 
#This makes it easier to compare individual values.

ggplot(data = Canteen_clean) + 
  geom_bar(mapping = aes(x = daytype, fill = Weekday), position = "dodge") +
  coord_flip()

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")


#position = "identity" - Problems with overlapping
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")

ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")



#The values of hwy and displ are rounded so the points appear on a grid and 
#many points overlap each other. This problem is known as overplotting. This 
#arrangement makes it hard to see where the mass of the data is.

#Avoid the gridding by setting position = "jitter", which adds a small amout of
#randomness to each point.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")


#Here we are making some data
df <- data.frame(x = c("a","a","b","b"), y = 2:5, g = rep(1:2, 2))
df
p <- ggplot(df, aes(x, y, group = g)) +
  geom_col(position = "dodge", fill = "grey50", colour = "black")
p
# A line range has no width:
p + geom_linerange(aes(ymin = y - 1, ymax = y + 1), position = "dodge")
# So you must explicitly specify the width
p + geom_linerange(
  aes(ymin = y - 1, ymax = y + 1),
  position = position_dodge(width = 0.9)
)
p + geom_errorbar(
  aes(ymin = y - 1, ymax = y + 1),
  width = 0.2,
  position = position_dodge(width = 0.9)
)



#More jitter
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point()

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty, y = hwy), position = "jitter")


#ggplot(data = Canteen_data_inRformat) + 
#  geom_bar(mapping = aes(x = Department)) +
#  coord_flip()

# Session 3
######

#Bar
ggplot(data = Canteen_data_inRformat) +
  geom_bar(mapping = aes(x = Department)) +
  coord_flip()

Canteen_data_inRformat %>% 
  count(Department)

#Histogram

ggplot(data = Canteen_data_inRformat) +
  geom_histogram(mapping = aes(x = Price01), binwidth = 0.5) +
  coord_flip()


ggplot(data = Canteen_data_inRformat) +
  geom_histogram(mapping = aes(x = Price01), binwidth = 5) +
  coord_flip()

Canteen_data_inRformat %>% 
  count(cut_width(Price01, 5))


ggplot(data = Canteen_data_inRformat) +
  geom_histogram(mapping = aes(x = Price01), binwidth = 10) +
  coord_flip()

ggplot(data = Canteen_data_inRformat) +
  geom_histogram(mapping = aes(x = Price01), binwidth = 25) +
  coord_flip()



#Clusters
ggplot(data = faithful, mapping = aes(x = eruptions)) + 
  geom_histogram(binwidth = 0.25)

# Chapter 7 

#Zooming in on unusual values
ggplot(diamonds) + 
  geom_histogram(mapping = aes(x = y), binwidth = 0.5)

ggplot(diamonds) + 
  geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))

unusual <- diamonds %>% 
  filter(y < 3 | y > 20) %>% 
  select(price, x, y, z) %>%
  arrange(y)
unusual

ggplot(data = Canteen_clean) + 
  geom_histogram(mapping = aes(x = sumprice), binwidth = 1000) +
  coord_cartesian(ylim = c(0, 50), xlim = c(15000, 25000))

unusual <- Canteen_clean %>% 
  filter(sumprice < 7500 | sumprice > 100000) %>% 
  select(sumprice, day, Weekday, daytype) %>%
  arrange(sumprice)
View(unusual)



#Missing values - Outliers: Drop them or make them into missing values.
#Imputation is beyond the scope of this course.


unusual <- Canteen_clean %>% 
  filter(sumprice < 7500 | sumprice > 100000) %>% 
  select(sumprice, day, Weekday, daytype) %>%
  arrange(sumprice)
View(unusual)



Canteen_clean_i <- Canteen_clean %>% 
  filter(between(sumprice, 7500, 35000))
View(Canteen_clean_i)

Canteen_clean_i <- Canteen_clean %>% 
  mutate(sumprice = ifelse(sumprice< 7500 | sumprice > 35000, NA, sumprice))
View(Canteen_clean_i)


#Box plot

ggplot(data = Canteen_clean, mapping = aes(x = Weekday, y = sumprice)) +
  geom_boxplot()

ggplot(data = Canteen_data_inRformat, mapping = aes(x = Department, y = Price01)) +
  geom_boxplot() +
  coord_flip()

#Reorder
ggplot(data = Canteen_clean) +
  geom_boxplot(mapping = aes(x = reorder(Weekday, sumprice, FUN = median), y = sumprice))

ggplot(data = Canteen_clean) +
  geom_boxplot(mapping = aes(x = reorder(Weekday, sumprice, FUN = median), y = sumprice)) +
  coord_flip()


#Two categorical variables
ggplot(data = Canteen_clean) +
  geom_count(mapping = aes(x = daytype, y = Weekday))


ggplot(data = diamonds) +
  geom_count(mapping = aes(x = cut, y = color)) 
#Wrong output in hardcopy book on page 100

Canteen_clean %>% 
  count(daytype, Weekday) %>%  
  ggplot(mapping = aes(x = daytype, y = Weekday)) +
  geom_tile(mapping = aes(fill = n))

Canteen_data_inRformat %>% 
  filter(Subsidy != " ") %>% 
  count(Salesunit, Subsidy) %>%  
  ggplot(mapping = aes(x = Salesunit, y = Subsidy)) +
  geom_tile(mapping = aes(fill = n)) +
  coord_flip()

View(Canteen_data_inRformat)


diamonds %>% 
  count(color, cut) %>%  
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))


#Two continuous variables

ggplot(data = Canteen_clean) +
  geom_point(mapping = aes(x = sumprice, y = sumtotprice))

ggplot(data = Canteen_clean) +
  geom_point(mapping = aes(x = sumprice, y = sumSodavand))


#Not shown in hardcopy book
ggplot(data = smaller) +
  geom_bin2d(mapping = aes(x = carat, y = price))

#Not shown in hardcopy book
ggplot(data = smaller) +
  geom_hex(mapping = aes(x = carat, y = price))


#Bin a continious variable and for each of these groups 
#display a boxplot 
ggplot(data = smaller, mapping = aes(x = carat, y = price)) + 
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.1)))

ggplot(data = Canteen_clean, mapping = aes(
  x = sumRABAT, y = sumLillebuffet
)) + 
  geom_boxplot(mapping = aes(
    group = cut_width(sumRABAT, 1000)
  ))


ggplot(data = smaller, mapping = aes(x = carat, y = price)) + 
  geom_boxplot(mapping = aes(group = cut_number(carat, 20)))


#modelr


ggplot(data = diamonds) + 
  geom_boxplot(mapping = aes(x = cut, y = price))



mod <- lm(log(price) ~ log(carat), data = diamonds)

summary(mod)

diamonds2 <- diamonds %>% 
  add_residuals(mod) %>% 
  mutate(resid = exp(resid))
View(diamonds2)

ggplot(data = diamonds2) + 
  geom_point(mapping = aes(x = carat, y = resid))

ggplot(data = diamonds2) + 
  geom_boxplot(mapping = aes(x = cut, y = resid))

ggplot(data = diamonds) + 
  geom_boxplot(mapping = aes(x = cut, y = price))

######
