wartosc <- punif(0.75, 0, 1) - punif(0.25, 0, 1)
print(wartosc)

# Zadanie 5
pnorm(1) #: X < 1
pnorm(-1) #: X <= -1
pnorm(1) - pnorm(-1) #: -1 < X < 1
pnorm(2) - pnorm(-2) #: -2 < X < 2
pnorm(3) - pnorm(-3) #: -3 < X < 3

# Zadanie 15
m <- integrate(intefn <- function(x) {
  x * (1 - x^3)
}, lower = 0, upper = 2)
print(m)

var_y <- integrate(var_y_fn <- function(x) {
  (x - (-4.4)) * (1 - x^3)
}, lower = 0, upper = 2)
print(var_y)
