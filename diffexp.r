#calculate differential expression gene
setwd("D:\\GSE9508\\cptac\\06.diff")
inputFile="normalize.csv"
pFilter=0.05
logFCfilter=0
conNum=13
treatNum=12


outTab=data.frame()
group=c(rep(1,conNum),rep(2,treatNum))
data=read.csv(inputFile,header=T,row.names=1)
data=as.matrix(data)


for(i in row.names(data)){
  geneName=i
  rt=rbind(expression=data[i,],group=group)
  rt=as.matrix(t(rt))
  tTest<-t.test(expression ~ group, data=rt)
  pvalue=tTest$p.value
  conGeneMeans=mean(data[i,1:conNum])
  treatGeneMeans=mean(data[i,(conNum+1):ncol(data)])
  logFC=treatGeneMeans-conGeneMeans
  conMed=median(data[i,1:conNum])
  treatMed=median(data[i,(conNum+1):ncol(data)])
  diffMed=treatMed-conMed
	if( ((logFC>0) & (diffMed>0)) | ((logFC<0) & (diffMed<0)) ){  
		  outTab=rbind(outTab,cbind(gene=i,conMean=conGeneMeans,treatMean=treatGeneMeans,logFC=logFC,pValue=pvalue))
	 }
}


row.names(outTab)=outTab[,1]
outTab=outTab[,-1]
write.csv(outTab,file="all.csv")
outDiff=outTab[( abs(as.numeric(as.vector(outTab$logFC)))>logFCfilter & as.numeric(as.vector(outTab$pValue))<pFilter),]
write.csv(outDiff,file="diff.csv")
heatmap=rbind(data[as.vector(row.names(outDiff)),])
write.csv(heatmap,file="diffProteinExp.csv")





