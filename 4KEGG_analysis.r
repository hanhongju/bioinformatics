

library("clusterProfiler")
library("org.Mm.eg.db")
library("enrichplot")
library("ggplot2")
library("digest")
library("GOplot")
library("colorspace")



workdir = r"(C:\Users\hj\Desktop\GSE209841)"
setwd(workdir)



data=read.csv("alldiffDEGwithID.csv",header = T,row.names = 1)
data=na.omit(data)


geneid=data$entrezID

kegganalysis <- enrichKEGG(gene = geneid,
                           organism = "mmu",
                           pvalueCutoff =0.05,
                           qvalueCutoff =1)


pdf(file="KEGGbarplot.pdf",width = 15,height = 15)
barplot(kegganalysis, drop = TRUE, showCategory = 30)
dev.off()

pdf(file="KEGGbubble.pdf",width = 15,height = 15)
dotplot(kegganalysis, showCategory = 30,orderBy = "GeneRatio")
dev.off()


keggresult4print=data.frame(Category = "All"
                          ,ID = kegganalysis$ID
                          ,Term = kegganalysis$Description
                          ,Genes = gsub("/", ", ", kegganalysis$geneID)
                          ,adj_pval = kegganalysis$p.adjust)

genelistid = data.frame(ID = data$entrezID ,logFC = data$logFC)
genelistsymbol = data.frame(ID = row.names(data) ,logFC = data$logFC)


circ = circle_dat(keggresult4print,genelistid)

circgenesymbol = mget(circ$genes, org.Mm.egSYMBOL, ifnotfound=NA) 
circgenesymbol <- as.character(circgenesymbol)
circ[,"genes"] = circgenesymbol


chord <- chord_dat(circ, genelistsymbol, keggresult4print$Term[1:5])
pdf(file="KEGGcircle.pdf",width = 20,height = 20)
GOChord(chord,
        gene.size = 8)
dev.off()




