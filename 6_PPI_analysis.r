


workdir = r"(C:\Users\hj\Desktop\GSE209841)"
setwd(workdir)


interactdata=read.table("PPI_result/string_interactions.tsv",
                sep="\t",header = T, comment.char = "")

geneedge=table(c(as.vector(interactdata[,1]),as.vector(interactdata[,2]))) 
geneedge=sort(geneedge,decreasing =T) 



geneNum=ifelse(length(geneedge)>30,30,length(geneedge))
geneedge30=as.matrix(geneedge)[1:geneNum,]


pdf(file="PPI_result/PPIbarplot.pdf",width = 10,height = 10)
par(mar=c(2.5,7,1,2),xpd=T)
bar=barplot(geneedge30,horiz=TRUE,col="blue",names=FALSE,xlim=c(0,120))
text(x=geneedge30+4,y=bar,geneedge30)
text(x=-10,y=bar,label=names(geneedge30))
dev.off()




hubnodgene=read.csv("PPI_result/hubnodeselected.csv",header = T, comment.char = "")

DEGfile=read.csv("alldiffDEG.csv",header = T)

hubnodgenewithDEG = subset(DEGfile, gene %in% hubnodgene$node_name)

write.csv(hubnodgenewithDEG, file = "hubnodDEG.csv", row.names = F)





