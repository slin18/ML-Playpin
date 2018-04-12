hc.complete <- hclust(dist(USArrests), method = "complete")
plot(hc.complete)

cutree(hc.complete, 3)

sd.data <- scale(USArrests)
hc.complete.sd <- hclust(dist(sd.data), method = "complete")
plot(hc.complete.sd)

names(Auto)
Auto

fit <- lm(year ~ weight*acceleration+weight*displacement, data = Auto[,1:8])
summary(fit)

plot(Auto$year, Auto$acceleration)

par(mfrow = c(2, 2))
plot(log(Auto$acceleration), Auto$horsepower)
plot(sqrt(Auto$acceleration), Auto$horsepower)
plot((Auto$acceleration)^2, Auto$horsepower)

set.seed(1)
x1 = runif(100)
x2 = 0.5*x1+rnorm(100)/10
y = 2+2*x1+0.3*x2+rnorm(100)

cor(x1, x2)
plot(x1,x2)

fit6 <- lm(y ~ x2)
summary(fit6)

x1 <- c(x1, 0.1)
x2 <- c(x2, 0.8)
y <- c(y, 6)
fit16 <- lm(y ~ x1 + x2)
fit17 <- lm(y ~ x1)
fit18 <- lm(y ~ x2)
summary(fit16)

par(mfrow = c(2, 2))
plot(fit18)