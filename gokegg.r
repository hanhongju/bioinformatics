#go and kegg analysis
library("clusterProfiler")
library("org.Hs.eg.db")
library("enrichplot")
library("ggplot2")

setwd("D:\\GSE9508\\cptac\\08.GO")
rt=read.csv("diffwithID.csv",header=T,row.names = 1)
rt=rt[is.na(rt[,"entrezID"])==F,]
gene=rt$entrezID


go <- enrichGO(gene = gene,
               OrgDb = org.Hs.eg.db, 
               pvalueCutoff =0.05, 
               qvalueCutoff = 0.05,
               ont="all",
               readable =T)
kk=go@result
write.table(kk,file="GO.txt",sep="\t",quote=F,row.names = F) 


pdf(file="barplot.pdf",width = 10,height = 8)
barplot(kk, drop = TRUE, showCategory =10,split="ONTOLOGY") + facet_grid(ONTOLOGY~., scale='free')
dev.off()


pdf(file="bubble.pdf",width = 10,height = 8)
dotplot(kk,showCategory = 10,split="ONTOLOGY",orderBy = "GeneRatio") + facet_grid(ONTOLOGY~., scale='free')
dev.off()
