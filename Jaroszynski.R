# install.packages("ggplot2")
# install.packages("e1071")
# install.packages("fitdistrplus")
library(ggplot2)
library(e1071)
library(fitdistrplus)

ccc <- read.csv("jjb_d.csv")

Zamkniecie <- ccc$Zamkniecie
Data <- ccc$Data

df <- data.frame(data = Data, zamkniecie = Zamkniecie)

# Zadanie 1
plot <- ggplot(df, aes(x = as.Date(data), y = zamkniecie, group = 1)) +
  geom_line(color = "red") +
  labs(x = "data", y = "Cena podczas zamknięcia")

ggsave("cena_podczas_zamkniecia.jpg", plot = plot, width = 12, height = 9, units = "cm", dpi = 480)

histogram <- hist(Zamkniecie, prob = TRUE, xlab = "Zamknięcie", ylab = "Gęstość")

# Zadanie 2
ccc_mean     <- mean(Zamkniecie)
ccc_sd       <- sd(Zamkniecie)
ccc_skewness <- skewness(Zamkniecie)
ccc_kurtosis <- kurtosis(Zamkniecie)

ccc_mean
ccc_sd
# skośna
ccc_skewness
# rozkład leptokurtyczny
ccc_kurtosis

# Zadanie 3

decay_norm  <- fitdist(Zamkniecie, "norm")
decay_lnorm <- fitdist(Zamkniecie, "lnorm")
decay_gamma <- fitdist(Zamkniecie, "gamma")

decay_norm
decay_lnorm
decay_gamma
