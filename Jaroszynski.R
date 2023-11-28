# install.packages("ggplot2")
# install.packages("e1071")
# install.packages("fitdistrplus")
library(ggplot2)
library(e1071)
library(fitdistrplus)

ccc <- read.csv("jjb_d.csv")
# View(ccc)

Zamkniecie <- ccc$Zamkniecie
Data <- ccc$Data

df <- data.frame(data = Data, zamkniecie = Zamkniecie)

wykres <- ggplot(df, aes(x = as.Date(data), y = zamkniecie, group = 1)) +
  geom_line(color = "red") +
  labs(x = "data", y = "Cena podczas zamknięcia")

ggsave("cena_podczas_zamkniecia.jpg", plot = wykres, width = 12, height = 9, units = "cm", dpi = 480)

histogram <- hist(Zamkniecie, prob = TRUE, xlab = "Zamknięcie", ylab = "Gęstość")
