Weekly
summary(Weekly)
cor(Weekly[,-9])
plot(Weekly$Volume)

glm.fit <- glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, data = Weekly, family = binomial)
summary(glm.fit)

attach(Weekly)
prob<-predict(glm.fit, type = "response") #predict function probabilities
pred.glm <- rep("Down", length(prob)) #replicates element with down with length of prob 
pred.glm[prob > 0.5] <- "Up" #for p value < 0.05
table(pred.glm, Direction)


Weekly.20092010 <- Weekly[!train, ] # for 2009 - 2010
Direction.20092010 <- Direction[!train] 
train <- (Year < 2009) #from 1990 - 2008
glm.fit <- glm(Direction ~ Lag2, data = Weekly, family = binomial, subset = train)
summary(glm.fit)

Weekly.20092010 <- Weekly[!train, ] # for 2009 - 2010
Direction.20092010 <- Direction[!train] 
probs2 <- predict(glm.fit, Weekly.20092010, type = "response")
glm.fit<- rep("Down", length(probs2))
glm.fit[probs2 > 0.5] <- "Up"
table(glm.fit, Direction.20092010)

attach(Default)
set.seed(1)
glm.fit <- glm(default ~ income + balance, family = binomial)
summary(glm.fit)

set.seed(1)

train <- sample(dim(Default)[1], dim(Default)[1] / 2)
glm.fit <- glm(default ~ income + balance + student, data = Default, family = "binomial", subset = train)
#summary(fit.glm)

probs <- predict(glm.fit, newdata = Default[-train, ], type = "response")
pred.glm <- rep("No", length(probs))
pred.glm[probs > 0.5] <- "Yes"
mean(pred.glm != Default[-train, ]$default)

#6
attach(Default)
set.seed(1)
glm.fit <- glm(default ~ income + balance, data = Default, family = "binomial")
summary(glm.fit)
summary(glm.fit)$coefficients[,2]

boot.fn <- function(data, index) {
  fit <- glm(default ~ income + balance, data = data, family = "binomial", subset = index)
  return(coef(fit))
}

library(boot)
boot(Default, boot.fn, 500)

#7
set.seed (1)
y=rnorm (100)
x=rnorm (100)
y=x-2* x^2+ rnorm (100)

plot(x,y)

library(boot)
set.seed(5)
Data <- data.frame(x,y)
fit.glm <- glm(y~x)
cv.glm(Data, fit.glm)$delta[1]

fit.glm.2 <- glm(y ~ poly(x, 2))
cv.glm(Data, fit.glm.2)$delta[1]

fit.glm <- glm(y ~ poly(x, 3))
cv.glm(Data, fit.glm)$delta[1]

fit.glm <- glm(y ~ poly(x, 4))
cv.glm(Data, fit.glm)$delta[1]

library(MASS)
attach(Boston)
muest <- mean(medv)
muest

seest <- sd(medv) / sqrt(dim(Boston)[1])
seest
set.seed(1)
boot.fn <- function(data, index) {
  mu <- mean(data[index])
  return (mu)
}
boot(medv, boot.fn, 1000)

t.test(medv)
#22.53 = mean of x and 0.4119 is the standard error
confI <- c(22.53 - 2 *0.4119, 22.53 + 2*0.4119)
confI

medest <- median(medv)
medest

boot.fn <- function(data, index) {
  mu <- median(data[index])
  return (mu)
}
boot(medv, boot.fn, 1000)

percentest <- quantile(medv, c(0.1))
percentest

boot.fn <- function(data, index) {
  mu <- quantile(data[index], c(0.1))
  return (mu)
}
boot(medv, boot.fn, 1000)



