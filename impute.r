#impute and normalize data
library(impute)
library(limma)
setwd("D:\\GSE9508\\cptac\\04.normalize")

file="GSE9508_matrixv3.csv"
rt2=read.csv(file,header=T,row.names=1)
rt2=as.matrix(rt2)

#impute the matrix
mat=impute.knn(rt2)
rt=mat$data

#normalize
normalizeData=normalizeBetweenArrays(as.matrix(rt))

#write outcomes
write.csv(normalizeData,file="normalize.csv")





