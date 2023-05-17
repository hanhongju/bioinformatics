

#设定工作目录及原始输入文件
workdir = r"(C:\Users\hj\Desktop\GSE209841)"
setwd(workdir)
inputFile = "gene_express_matrix.csv"


#设定数据格式
conNum = 192
treatNum = 192
group = c(rep(1,conNum),rep(2,treatNum))


#去除重复的行
dataraw=read.csv(inputFile,header = T)
datadistinctwithrow=dataraw[!duplicated(dataraw$Symbol),]


#将行名作为数据框行名
row.names(datadistinctwithrow)=datadistinctwithrow[,1]
datadistinctwithrow=datadistinctwithrow[,-1]


#交换对照和处理组位置
groupcontrol = datadistinctwithrow[,193:384]
grouptreat   = datadistinctwithrow[,1:192]

datagood=cbind(groupcontrol,grouptreat)


#输出处理好的数据
write.csv(datagood,file = "gene_express_matrix_good.csv",row.names=T,col.names=T)


#读取数据
data=read.csv("gene_express_matrix_good.csv",header = T,row.names = 1)
data=as.matrix(data)


#设定计算差异基因参数
pFilter = 0.05
logFCfilter = 0


#差异分析
#所有差异基因写入outTab中
outTab=data.frame()

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

#p<0.05的差异基因写入outDiff中
outDiff=outTab[(abs(as.numeric(as.vector(outTab$logFC)))>logFCfilter & as.numeric(as.vector(outTab$pValue))<pFilter),]


#输出outTab和outDiff
write.csv(outTab,file="allDEG.csv",row.names = F)
write.csv(outDiff,file="alldiffDEG.csv",row.names = F)


