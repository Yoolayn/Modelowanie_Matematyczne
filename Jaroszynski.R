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

# Zadanie 4

legendary <- c("norm", "lnorm", "gamma")
par(mfrow = c(2, 2))
denscomp(list(decay_norm, decay_lnorm, decay_gamma), legendtext = legendary)
qqcomp(list(decay_norm, decay_lnorm, decay_gamma), legendtext = legendary)
cdfcomp(list(decay_norm, decay_lnorm, decay_gamma), legendtext = legendary)
ppcomp(list(decay_norm, decay_lnorm, decay_gamma), legendtext = legendary)

# na podstawie tych 4 wykresów można wywnioskować że wykres lnorm jest najlepiej opisuje kursy zamknięcia, ale aby to dokładnie stwierdzić trzeba wykonać analizę statystyk , ale aby to dokładnie stwierdzić trzeba wykonać analizę statystyk KS, CM i AD oraz kryteriów informacyjnych AIC i BIC

gofstat(
        list(decay_norm, decay_lnorm, decay_gamma),
        fitnames = legendary
)

# analiza statystyk według tych 3 ziomów, moich ziomów oraz kryteriów AIC i BIC potwierdza to założenie # ładnie napisać w latexxieiee

# Zadanie 5
N <- 10000
n <- 100
D <- c()

for (i in 1:N) {
  y_lnorm <- rlnorm(n, decay_lnorm$estimate[1], decay_lnorm$estimate[2])
  D[i] <- ks.test(
                     y_lnorm,
                     plnorm,
                     decay_lnorm$estimate[1],
                     decay_lnorm$estimate[2],
                     exact = TRUE
  )$statistic
}

dn_length <- ks.test(
                     Zamkniecie,
                     plnorm,
                     decay_lnorm$estimate[1],
                     decay_lnorm$estimate[2],
                     exact = TRUE,
)$statistic

dn_length

par(mfrow = c(1, 1))
hist(D, prob = TRUE)
points(dn_length, 0, pch = 19, col = "purple")

p_value <- length(D[D > dn_length]) / N
p_value

# Nie spełnia kontr hipotezy
