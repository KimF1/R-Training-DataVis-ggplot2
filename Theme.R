library(tidyverse)
theme <- theme(axis.title.x = element_text(size = 10), 
         axis.title.y = element_text(size=10),
         axis.text.x = element_text(color="black"),
         axis.text.y = element_text(color="black"),
         plot.title = element_text(hjust =0.5, size = 17),
         panel.grid.major=element_line(colour="dimgrey", size=0),
         panel.grid.minor=element_line(color="dimgrey", size=0),
         panel.background=element_rect(color="grey100"),
         panel.border=element_rect(color="dimgrey", fill = NA))
?theme

