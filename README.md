# MechaCar_Statistical_Analysis

## Linear Regression to Predict MPG
For this analysis, the given ```MechaCar_mpg.csv``` dataset provides ```mpg``` test results for 50 prototype MechaCars. Each of the prototypes were produced using multiple design specifications to identify ideal vehicle performance. Multiple metrics, such as ```vehicle length```, ```vehicle weight```, ```spoiler angle```, ```drivetrain``` ```ground clearance``` and whether or not the vehicle was all wheel drive(```awd```)  were collected.

The purpose of the below analysis is to determine if any of the variation in ```mpg``` can be explained by the other independent variables: ```vehicle length```, ```vehicle weight```, ```spoiler angle```, ```drivetrain``` ```ground clearance``` and ```awd```.

Exploring the data set:<br>
![mecha_table_head](https://user-images.githubusercontent.com/89284280/145135283-388742d3-9dc7-4369-9130-6c1439e00997.JPG)
<br>

Using RStudio, and the ```tidyverse``` library a multiple linear regression was performed on the dependent and independent variables.
```
library(tidyverse)
#
MechaCar_Table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
# Multiple Linear Regression
multiple_regression <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_Table)
summary_multiple_regression <- summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_Table))
summary_multiple_regression
```

### Analysis
![mecha_multiple_regression](https://user-images.githubusercontent.com/89284280/145135846-6c80f649-46e2-4671-b40e-bb19bdd8cd84.JPG)

From the multiple linear regression output, we can see that:
- The Adjusted R-squared = 68.25%. This means that 68.25% of the variablilty of ```mpg``` is explained using this linear model
- Of the 5 independent variables, only two (2) are statistically significant: vehicle_length and ground_clearance.
- The intercept is also statistically significant. This means when all the other independent variables are set to 0, that the intecept itself explains a significant amount of variability in the dependent variable.

### Results
Overall, this model does a decent job at predicting the variability in ```mpg``` but there is definitely room for improvement. Further, the slope of the model is also not 0 due to having a couple significant independent variables.

## Summary Statistics on Suspension Coils
For this next analysis, the given ```Suspension_Coil.csv``` dataset contains the weight capacities (PSI) of suspension coils that were tested on unique vehicle in order to determine if the manufacturing process was consistent across production sites (Lot1, Lot2, Lot3). The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Question: Does the manufacturing data meet this design specification for all manufacturing lots in total and each lot individually?

### Analysis
Using R, the dataframe was established:<br>
![suspension_table](https://user-images.githubusercontent.com/89284280/145318883-9191a3ba-1575-4f34-be69-4f9dfd423ab3.JPG)
<br>
<br>
Descriptive statistics of the entire manufacturing population was caluclated:<br>

```total_summary <- Suspension_Coil_Table %>% summarize(Mean_PSI=mean(PSI),Median_PSI=median(PSI),Variance_PSI=var(PSI),SD_PSI=sd(PSI))```

![total_summary](https://user-images.githubusercontent.com/89284280/145318974-83a574ac-327d-4ea9-bb36-428d5fd0f36c.JPG)
<br>
<br>
Descriptive statistics of each manufacturing Lot were caluclated:<br>

```lot_summary <- Suspension_Coil_Table %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),Median_PSI=median(PSI),Variance_PSI=var(PSI),SD_PSI=sd(PSI), .groups = 'keep')```

![lot_smmary](https://user-images.githubusercontent.com/89284280/145319044-a0c5d9ac-ef33-41e8-906c-5b0e59f9bd09.JPG)
<br>

### Results
As we can see from the analysis above, the variance of the population is within the 100 pounds per square inch requirement. However, when we look at the variance of the three subsets, Lot3 stands out with a variance over 100. This indicates that the results of Lot3 are far from the mean and far from each other.

## T-Tests on Suspension Coils
