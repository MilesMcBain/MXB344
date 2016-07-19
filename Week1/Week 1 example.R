library(car)
data("Duncan")
modelfit <- lm(prestige ~ type + log(income) + education, 
               data = Duncan)
summary(modelfit)
plot(modelfit)

modelfit2 <- glm(prestige ~ type + log(income) + education, data=Duncan, 
                 family = gaussian(link="identity"))
summary(modelfit2)
plot(modelfit2)
1-(4055.4/43687.6) #Psuedo R^2 
#Logistic regression is always heteroskedastic
#log transfor