#1
rate = 2/20
p1 = pexp(15, rate = rate)
print(p1)

#2
lambda <- 2
p2 <- dpois(0, lambda)
print(p2)

#3 
n <- 20
p <- 0.05
p3 <- 1 - pbinom(2, size = n, prob = p)
print(p3)

