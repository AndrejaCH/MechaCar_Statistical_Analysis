#load packages
library(dplyr)
library(tidyverse)

### Deliverable 1 ###

#Import and read the csv file
mecha_car <- read.csv(file = 'MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

#Linear regression, pass all 6 columns
lm(mpg ~ vehicle_weight + 
     spoiler_angle + ground_clearance + AWD + vehicle_length,data=mecha_car)

#p-value and r-squared
summary(lm(mpg ~ vehicle_weight + 
             spoiler_angle + ground_clearance + AWD + vehicle_length,data=mecha_car))




### Deliverable 2 ###

#Import and read the csv file
suspen_coil <- read.csv(file = 'Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

#Create total summary df, using summarize()
total_summary <-  suspen_coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')


#Create lot summary df, using group_by() & summarize()
lot_summary <- suspen_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

  
  
###  Deliverable 3 ###

#perform t-test to determine if the PSI across all manufacturing lots is statistically different from the population mean 
#of 1,500 pounds per square inch.

#create a sample of 50 randomly sampled data points
sample_suspen_coil = suspen_coil %>% sample_n(50)

#compare sample versus population means
t.test(log10(sample_suspen_coil$PSI),mu=mean(log10(suspen_coil$PSI)))


##additional t-tests (1)
## difference between filter and subset?
lot1_filter <- suspen_coil %>% filter(Manufacturing_Lot=="Lot1")
t.test(log10(lot1_filter$PSI),mu=mean(log10(suspen_coil$PSI)))

lot1 <- suspen_coil %>% subset(Manufacturing_Lot=="Lot1")
t.test(log10(lot1$PSI),mu=mean(log10(suspen_coil$PSI)))


##additional t-tests (2)
lot2 <- suspen_coil %>% subset(Manufacturing_Lot=="Lot2")
t.test(log10(lot2$PSI),mu=mean(log10(suspen_coil$PSI)))

##additional t-tests (3)
lot3 <- suspen_coil %>% subset(Manufacturing_Lot=="Lot3")
t.test(log10(lot3$PSI),mu=mean(log10(suspen_coil$PSI)))

### Deliverable 4 ###

  