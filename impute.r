#impute and normalize data
library(impute)
library(limma)
setwd("D:\\GSE9508\\cptac\\04.normalize")
file="GSE9508_matrixv3.csv"
readtable=read.csv(file,header=T,check.names=F,row.names=1)
readtable=as.matrix(readtable)
imputedmatrix=impute.knn(readtable)
readtable=imputedmatrix$data
#normalize
normalizedData=normalizeBetweenArrays(as.matrix(readtable))
normalizedData=rbind(geneNames=colnames(normalizedData),normalizedData)
write.table(normalizedData,file="normalize.txt",sep="\t",quote=F,col.names=F)





