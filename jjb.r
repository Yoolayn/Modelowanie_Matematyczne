ccc <- read.csv("jjb_d.csv")
View(ccc)
class(ccc)

par(mfrow = c(2, 2))
hist(ccc$Otwarcie)
hist(ccc$Otwarcie, prob = TRUE)
plot(ccc$Otwarcie, ccc$Zamkniecie)
