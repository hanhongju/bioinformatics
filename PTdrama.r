#PT站魔力值计算代码
if (!require("plotly"))            install.packages("plotly")
library(plotly)

#绘制中间变量A图
Ti   = seq(0.1, 15, by=0.1)
Ni   = seq(1, 15, by=0.1)
T0   = 4
N0   = 7
A    = outer(Ti, Ni, FUN = function(Ti, Ni)   (1-10^(-Ti/T0))*(1+2^0.5*10^(-(Ni-1)/(N0-1))))
plot_ly(x = ~Ni, y = ~Ti, z = ~A, type = "surface", color = "black")

#绘制魔力值B折线图
A    = seq(0, 2000, by=100)
B0   = 100
L    = 300
B    = B0*2/pi*atan(A/L)
plot_ly(x = ~A, y = ~B, type = "scatter", mode = "markers+lines")




