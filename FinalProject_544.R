data <- read.csv("ObesityDataSet_raw_and_data_sinthetic.csv")
head(data)
dim(data)
data$Height = data$Height*100
set.seed(47)
id <- sample(seq_len(nrow(data)), size = 200)
sample_data <- data[id, ]
m1 <- lm(Weight~Height, data = sample_data)

plot(sample_data$Height, sample_data$Weight,
     pch = 19,                     
     col = "#1f77b4",              
     xlab = "Height (cm)",
     ylab = "Weight (kg)",
     main = "Height vs Weight with Regression Line (n = 200)")
abline(m1,                        
       col = "red",               
       lwd = 2)                 

summary(m1)
confint(m1)
par(mfrow=c(1,2))
plot(m1, ask = F)


library(dplyr)

data <- data %>%
  mutate(
    group = case_when(
      NObeyesdad == "Insufficient_Weight"                                    ~ "Insufficient_Weight",
      NObeyesdad == "Normal_Weight"                                          ~ "Normal_Weight",
      NObeyesdad %in% c("Overweight_Level_I", "Overweight_Level_II")         ~ "Overweight",
      NObeyesdad %in% c("Obesity_Type_I", "Obesity_Type_II", "Obesity_Type_III") ~ "Obesity",
      TRUE                                                                    ~ NA_character_
    ),
    group = factor(group, levels = c("Insufficient_Weight", "Normal_Weight", "Overweight", "Obesity"))
  )

table(data$group)
aov1 <- aov(Age~group, data=data)
summary(aov1)
aggregate(data$Age, by=list(data$group), summary)

test <- lm(Age~group, data = data)
par(mfrow=c(1,2))
plot(test, which = 2)
plot(test, which = 3)

library('caret')
preObj <- preProcess(data[, "Age", drop = FALSE], method = "BoxCox")
data$Age_bc <- predict(preObj, data[, "Age", drop = FALSE])$Age

print(preObj)  
head(data[, c("Age", "Age_bc")])

m_bc <- lm(Age_bc ~ group, data = data)
par(mfrow=c(1,2))
plot(m_bc, which=2, main="Normal Q–Q (Box–Cox)")
plot(m_bc, which=1, main="Residuals vs Fitted (Box–Cox)")
par(mfrow=c(1,1))

anova_bc <- aov(Age_bc ~ group, data = data)
summary(anova_bc)
TukeyHSD(anova_bc)
plot(TukeyHSD(anova_bc), cex.axis=0.7) 



