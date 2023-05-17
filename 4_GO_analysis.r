
library("org.Mm.eg.db")
library("clusterProfiler")
library("enrichplot")
library("ggplot2")
library(GOplot)
library(stringr)
#设定工作目录及DEG文件
workdir = r"(C:\Users\hj\Desktop\GSE209841)"
setwd(workdir)
degfile = "alldiffDEG.csv"


#读取文件
dataraw=read.csv(degfile,header=T)
genes=dataraw[,1]


#找出基因对应的id
entrezIDs <- mget(genes, org.Mm.egSYMBOL2EG, ifnotfound=NA) 
entrezIDs <- as.character(entrezIDs)


#添加到表中
data=cbind(dataraw,entrezID=entrezIDs)


#输出结果
write.csv(data,file="alldiffDEGwithID.csv",row.names = F)


#读取结果，删除NA值，注意上步不能直接去除，有BUG
data=read.csv("alldiffDEGwithID.csv",header = T,row.names = 1)
data=na.omit(data)


#GO富集分析
geneid=data$entrezID
goanalysis  <- enrichGO(gene = geneid,
               OrgDb = org.Mm.eg.db, 
               pvalueCutoff =0.05, 
               qvalueCutoff = 0.05,
               ont="all",
               readable = T)




#绘制条形图和气泡图，读取的结果没办法画，不知为什么
pdf(file="GObarplot.pdf",width = 15,height = 15)
barplot(goanalysis, drop = TRUE, showCategory =10,split="ONTOLOGY",space=1) + facet_grid(ONTOLOGY~., scale='free')
dev.off()
pdf(file="GObubble.pdf",width = 15,height = 15)
dotplot(goanalysis,showCategory = 10,split="ONTOLOGY",orderBy = "GeneRatio") + facet_grid(ONTOLOGY~., scale='free')
dev.off()





goresult4print=data.frame(Category = "All"
                           ,ID = goanalysis$ID
                           ,Term = goanalysis$Description
                           ,Genes = gsub("/", ", ", goanalysis$geneID)
                           ,adj_pval = goanalysis$p.adjust)
genelist <- data.frame(ID = row.names(data) ,logFC = data$logFC)
circ = circle_dat(goresult4print,genelist)
circ[,"genes"] = str_to_title(circ[,"genes"])

termNum = 5


#绘制和弦图
chord <- chord_dat(circ, genelist, goresult4print$Term[1:termNum])
pdf(file="GOcircle.pdf",width = 11,height = 10.5)
GOChord(chord, 
        space = 0.001,           #基因之间的间距
        gene.order = 'logFC',    #按照logFC值对基因排序
        gene.space = 0.25,       #基因名跟圆圈的相对距离
        gene.size = 4,           #基因名字体大小 
        border.size = 0.1,       #线条粗细
        process.label = 7.5)     #term字体大小
dev.off()


#绘制维恩图
set1 = subset(circ,term=='cytoplasmic translation')
set2 = subset(circ,term=='ameboidal-type cell migration')
set3 = subset(circ,term=='extracellular matrix organization')

pdf(file="GOVenn.pdf",width = 10,height = 8)
GOVenn(set1[,c("genes","logFC")], set2[,c("genes","logFC")], set3[,c("genes","logFC")]
      ,label = c('cytoplasmic translation'
                 ,'ameboidal-type cell migration'
                 ,'extracellular matrix organization'))
dev.off()






