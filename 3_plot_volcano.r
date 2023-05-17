#volcano plot
library('gplots')


pdf(file="volcano.pdf",width = 8,height = 8)
xMax=5
yMax=5
allDiff=all
plot(allDiff$logFC,  -log10(allDiff$FDR),
     xlab = "lg(FC)", ylab = "-lg(FDR)", main = "St2-/- vs WT volcano plot",
     xlim = c(-xMax,xMax),  ylim = c(0,yMax),
     yaxs="i",  pch=20, cex=1)
uppoints   =allDiff[allDiff$FDR  <  0.05   &   allDiff$logFC  >  1, ]
downpoints =allDiff[allDiff$FDR  <  0.05   &   allDiff$logFC  < -1, ]
ifng=all[rownames(all) == "Ifng", ]
points(uppoints$logFC     ,-log10(uppoints$FDR)     ,pch=20   ,col="red"    ,cex=1)
points(downpoints$logFC   ,-log10(downpoints$FDR)   ,pch=20   ,col="green"  ,cex=1)
points(ifng$logFC, -log10(ifng$FDR), pch=20,col="chocolate", cex=1)
abline(h=-log10(0.05)   ,lty=2   ,lwd=1)
abline(v=1   ,lty=2   ,lwd=1)
abline(v=-1  ,lty=2   ,lwd=1)
dev.off()




diffsig    =  all[all$FDR  < 0.05   & abs(all$logFC) >  1        ,]
diffup     =  all[all$FDR  < 0.05   &     all$logFC  >  1        ,]
diffdown   =  all[all$FDR  < 0.05   &     all$logFC  < -1        ,]
diffbigSig  =  diffsig[(diffsig$FDR < 0.05 & (diffsig$logFC >  3 |  diffsig$logFC< -3)) , ]
heatmapData  =  newData[rownames(diffbigSig),]
hmExp=log10(heatmapData+0.001)
hmMat=as.matrix(hmExp)
colnames(hmMat) = group
pdf(file="heatmap.pdf",width = 10,height = 10)
heatmap.2(hmMat, col = 'greenred', trace="none"
          ,cexCol = 1    ,cexRow = 1  )
dev.off()




