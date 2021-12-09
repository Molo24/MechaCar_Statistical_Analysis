###################
# DELIVERABLE 1
###################
library(tidyverse)
#
MechaCar_Table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
#
head(MechaCar_Table)
#
#plt <- ggplot(MechaCar_Table,aes(x=vehicle_length,y=mpg))
#plt + geom_point()
###
# Simple Linear Regression on vehicle_length
model_vehicle_length <- lm(mpg ~ vehicle_length,MechaCar_Table)
summary_vl <- summary(lm(mpg ~ vehicle_length,MechaCar_Table))
summary_vl
yvals_model_vehicle_length <- model_vehicle_length$coefficients['vehicle_length']*MechaCar_Table$vehicle_length +
  model_vehicle_length$coefficients['(Intercept)'] #determine y-axis values from linear model
plt_vl <- ggplot(MechaCar_Table,aes(x=vehicle_length,y=mpg)) #import dataset into ggplot2
plt_vl + geom_point() + geom_line(aes(y=yvals_model_vehicle_length), color = "red") #plot scatter and linear model
###
# Simple Linear Regression on vehicle_weight
model_vehicle_weight <- lm(mpg ~ vehicle_weight,MechaCar_Table)
summary_vw <- summary(lm(mpg ~ vehicle_weight,MechaCar_Table))
summary_vw
yvals_model_vehicle_weight <- model_vehicle_weight$coefficients['vehicle_weight']*MechaCar_Table$vehicle_weight +
  model_vehicle_weight$coefficients['(Intercept)'] #determine y-axis values from linear model
plt_vw <- ggplot(MechaCar_Table,aes(x=vehicle_weight,y=mpg)) #import dataset into ggplot2
plt_vw + geom_point() + geom_line(aes(y=yvals_model_vehicle_weight), color = "red") #plot scatter and linear model
###
# Simple Linear Regression on spoiler_angle
model_spoiler <- lm(mpg ~ spoiler_angle,MechaCar_Table)
summary_spoiler <- summary(lm(mpg ~ spoiler_angle,MechaCar_Table))
summary_spoiler
yvals_model_spoiler <- model_spoiler$coefficients['spoiler_angle']*MechaCar_Table$spoiler_angle +
  model_spoiler$coefficients['(Intercept)'] #determine y-axis values from linear model
plt_spoiler <- ggplot(MechaCar_Table,aes(x=spoiler_angle,y=mpg)) #import dataset into ggplot2
plt_spoiler + geom_point() + geom_line(aes(y=yvals_model_spoiler), color = "red") #plot scatter and linear model
###
# Simple Linear Regression on ground_clearance
model_ground_clearance <- lm(mpg ~ ground_clearance,MechaCar_Table)
summary_gc <- summary(lm(mpg ~ ground_clearance,MechaCar_Table))
summary_gc
yvals_ground_clearance <- model_ground_clearance$coefficients['ground_clearance']*MechaCar_Table$ground_clearance +
  model_ground_clearance$coefficients['(Intercept)'] #determine y-axis values from linear model
plt_gc <- ggplot(MechaCar_Table,aes(x=ground_clearance,y=mpg)) #import dataset into ggplot2
plt_gc + geom_point() + geom_line(aes(y=yvals_ground_clearance), color = "red") #plot scatter and linear model
###
# Simple Linear Regression on AWD
model_awd <- lm(mpg ~ AWD,MechaCar_Table)
summary_awd <- summary(lm(mpg ~ AWD,MechaCar_Table))
summary_awd
###
# Multiple Linear Regression
multiple_regression <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_Table)
summary_multiple_regression <- summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_Table))
summary_multiple_regression

###################
# DELIVERABLE 2
###################
Suspension_Coil_Table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
#
head(Suspension_Coil_Table)
#
total_summary <- Suspension_Coil_Table %>% summarize(Mean_PSI=mean(PSI),Median_PSI=median(PSI),Variance_PSI=var(PSI),SD_PSI=sd(PSI))
total_summary
#
lot_summary <- Suspension_Coil_Table %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),Median_PSI=median(PSI),Variance_PSI=var(PSI),SD_PSI=sd(PSI), .groups = 'keep')
lot_summary

###################
# DELIVERABLE 3
###################
t_test_ungrouped <- t.test(Suspension_Coil_Table$PSI,mu=1500)
t_test_ungrouped
# Lot 1
lot1_table <- Suspension_Coil_Table[Suspension_Coil_Table$Manufacturing_Lot == "Lot1", ]
t_test_lot1 <- t.test(lot1_table$PSI,mu=1500)
t_test_lot1
# Lot 2
lot2_table <- Suspension_Coil_Table[Suspension_Coil_Table$Manufacturing_Lot == "Lot2", ]
t_test_lot2 <- t.test(lot2_table$PSI,mu=1500)
t_test_lot2
# Lot 3
lot3_table <- Suspension_Coil_Table[Suspension_Coil_Table$Manufacturing_Lot == "Lot3", ]
t_test_lot3 <- t.test(lot3_table$PSI,mu=1500)
t_test_lot3

