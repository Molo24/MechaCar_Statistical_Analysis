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

Results<br>
![mecha_multiple_regression](https://user-images.githubusercontent.com/89284280/145135846-6c80f649-46e2-4671-b40e-bb19bdd8cd84.JPG)

From the multiple linear regression output, we can see that:
- The Adjusted R-squared = 68.25%. This means that 68.25& of the variablilty of ```mpg``` is explained using this linear model
- Of the 5 independent variables, only two (2) are statistically significant: vehicle_length and ground_clearance.
- The intercept is also statistically significant. This means when all the other independent variables are set to 0, that the intecept itself explains a significant amount of variability in the dependent variable.

Overall, this model does a decent job at predicting the variability in ```mpg``` but there is definitely room for improvement.
