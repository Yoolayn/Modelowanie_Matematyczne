ccc <- read.csv("ccc_d.csv")
View(ccc)
class(ccc)

otwarcie <- ccc$Otwarcie
zamkniecie <- ccc$Zamkniecie
par(mfrow = c(2, 2))
hist(otwarcie)
hist(otwarcie, prob = TRUE)
plot(otwarcie, zamkniecie)
