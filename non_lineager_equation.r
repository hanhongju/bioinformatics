# coupon payment per period
pmt = 55
# future value paid at maturity
fv = 1000
# Number of Periods Required
nper = 26
# Present Value
pv = 1169
# y <- yield to first par call 
# uniroot函数求解非线性方程
f <- function(y) pmt*((1-1/(1+y)^nper)/y)+fv/(1+y)^nper-pv
sloveuniroot <- uniroot(f,c(-1,1))
sloveuniroot$root
# nleqslv包求解非线性方程（组）
library(nleqslv)
equations <- function(x) {
  f1 <- pmt*((1-1/(1+x[1])^nper)/x[1])+fv/(1+x[1])^nper-pv
  return(c(f1))
}
slove <- nleqslv(1, equations)
slove$x
rm(list = ls())




# 参考文献https://blog.51cto.com/u_16213380/12522271
