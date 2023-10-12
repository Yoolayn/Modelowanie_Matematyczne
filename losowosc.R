#Czy poniższe wyniki ankiety pochodza z losowo wybranej proby?
#Jakt Ty rozumiesze losowosc?
#Jak w losowo wybranej probie, o okreslonej liczbie zer (n0)
#i okreslonej liczbie jedynek (n1), 'grupuja' sie zera i jedynki?
#Ile jest serii zer? Ile jest serii jedynek?

#Przyklad
#=========
#Wyniki ankiety dostarczonej przez dwoch ankieterow x i y (n = 20)
x <- c(0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0)
y <- c(1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0)

#liczba jedynek (n1 = 8)
sum(x)
sum(y)

#1. Oliczymy liczbe serii zer, serii jedynek w wektorach x i y.
#2. Porownamy z liczbami serii w N = 10000 losowo wygenerowanych ciagach
#o takiej samie liczbie zer n0 = 12 i jedynek n1 = 8 jak w x i y.

#Ad. 1 W punkcie 1. wykorzystamy funkcje 'rle'.
#==============================================
#Co robi funkcja 'rle'? Napisz w konsoli ?rle i przeczytaj.
rle(x)

#funkcja zliczajaca, dla danego wektora x, liczbe serii zer, serii jedynek
#oraz wszystkich serii
num_serii <- function(x) {
  serie0 <- length(rle(x)$lengths[rle(x)$values == 0])
  serie1 <- length(rle(x)$lengths[rle(x)$values == 1])
  serie <- serie0 + serie1
  return(c(serie0, serie1, serie))
}

#zlicz serie i sprawdz, czy wynik zgadza sie z wynikiem otrzymanym
#z wykorzystaniem funkcji 'num_serii'
wynik_ankieter_x <- num_serii(x)
wynik_ankieter_y <- num_serii(y)
wynik_ankieter_x
wynik_ankieter_y
#3 2 5
#8  8 16

#Ad.2 Generujemy N ciagow o dlugosci n #oraz liczbie zer n0 i liczbie
#jedynek n1.
#===============================================================================
#Liczba ciagow do wygenerowania
N <- 10000

#Dlugosc kazdego ciagu
# dla y n1 jest takie samo, nie trzeba powtarzac generowania
n <- 20
n1 <- sum(x)

#Generowanie 1000 ciaw ankiecie y liczba jedynek jest taka sama
ciagi <- t(replicate(N, sample(c(rep(0, n - n1), rep(1, n1)))))

# Wynik to macierz zawierająca n = 20 kolumn (jeden ciag na wiersz)
head(ciagi)
dim(ciagi)

#zliczamy serie zer, serie jedynek i razem wszystkie serie, dla kazdego ciagu
wynik <- t(apply(ciagi, 1, num_serii)) #'t' robi transpozycje macierzy
colnames(wynik) <- c("serie0", "serie1", "serie")
head(wynik)
dim(wynik)

#liczba serii zer/jedynek/wszyskich serii (w procentach) na wykresie
par(mfrow  =  c(3, 1))
plot(table(wynik[, 1]) / N, ylab = "procent")
plot(table(wynik[, 2]) / N, ylab = "procent")
plot(table(wynik[, 3]) / N, ylab = "procent")

#SPRAWDZENIE ankieterow
#=======================
#Jak wyniki ankieterow (wektory x i y) maja sie do tych wygenerowanych?
wynik_ankieter_x <- num_serii(x)
wynik_ankieter_y <- num_serii(y)
wynik_ankieter_x
wynik_ankieter_y

#zobacz na wykresach jak czesto dane wyniki pojawily sie
#w wygenerowanych probach
#procent wynikow (serii) uzyskanych przez ankietera
#wsrod otrzymanych w losowym generowaniu
pr_x <- sapply(1:3, function(i) sum(wynik[, i] == wynik_ankieter_x[i]) / N)
pr_y <- sapply(1:3, function(i) sum(wynik[, i] == wynik_ankieter_y[i]) / N)
pr_x
pr_y

#Wyglada na to, ze w jednym i drugim przypadku mamy dosyc nietypowe wyniki.
#W przypadku x serii jest troche malo, a w przypadku  y troche duzo?

my_list <- list(a = 2, b = c(1, 2), c = "liczba")
my_list$a

x <- data.frame(a = 1:2, b = 8:9)
y <- matrix(1:4, nrow = 2, ncol = 2)

colnames(y) <- c("a", "b")

#Zadanie
#========
#1. Porownaj liczbe serii w Twoim wektorze z wynikami otrzymanymi w
#losowym generowaniu.
#Pamietaj o przypisaniu odpowiedniej wartosci dla n1 tak, aby
#byla zgodna z wynikiem Twojej ankiety.

#2. Zobacz jaki jest rozkład serii (na wykresach) dla n = 100 i n1 = 50.
#Sprawdź jak to sie zmienia dla innych wartosci n1.
