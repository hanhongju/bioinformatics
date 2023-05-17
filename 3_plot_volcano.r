

library('gplots')


workdir = r"(C:\Users\hj\Desktop\GSE209841)"
setwd(workdir)
inputFile = "alldiffDEG.csv"


data=read.csv(inputFile,header = T,row.names = 1)
uppoints   =data[data$pValue  <  0.05   &   data$logFC  >  1, ]
downpoints =data[data$pValue  <  0.05   &   data$logFC  < -1, ]




pdf(file="DEGvolcano.pdf",width = 8,height = 8)
xMax=500
yMax=6
plot(data$logFC,  -log10(data$pValue),
     xlab = "lg(FC)", ylab = "-lg(pValue)",
     main = "Spinal Cord Injury VS Naive",
     xlim = c(-xMax,xMax),  ylim = c(1,yMax),
     yaxs="i",  pch=20, cex=1)

points(uppoints$logFC     ,-log10(uppoints$pValue)     ,pch=20   ,col="red"          ,cex=1)
points(downpoints$logFC   ,-log10(downpoints$pValue)   ,pch=20   ,col="aquamarine4"  ,cex=1)
abline(v=0   ,lty=2   ,lwd=1)
abline(h=1.2   ,lty=2   ,lwd=1)
dev.off()




