
y=1
pvalue = function(x){
return(55*((1-1/(1+x)^26)/x)+1055/(1+x)^26)
}



price = 1169
while   (pvalue(y) - price > 0.01)
y=y+0.000001
end
while   (pvalue(y) - price < -0.01)
y=y-0.000001
end
y
pvalue(y)




