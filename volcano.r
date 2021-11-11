#volcano plot



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




