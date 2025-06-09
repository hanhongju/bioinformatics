pkgs = c("affy","beeswarm","biomaRt","car","caret","checkmate","ChIPseeker","clusterProfiler","colorspace"
         ,"devtools","digest","DOSE","dplyr","dplyr","edgeR","ellipsis","enrichplot","foreign","ggplot2","curl","packrat","rsconnect"
         ,"ggpmisc","ggpubr","ggpubr","ggsci","ggtext","GOplot","gower","gplots","gridtext","igraph","impute"
         ,"ipred","limma","lme4","monocle","openxlsx","org.Hs.eg.db","org.Mm.eg.db","pbkrtest","pkgbuild"
         ,"pkgload","plotly","profvis","ReactomePA","remotes","reticulate","rms","rstatix","rtracklayer","nleqslv"
         ,"sessioninfo","Seurat","stringi","stringr","survival","survivalROC","survminer","tcltk","tidyverse"
         ,"urlchecker","usethis","utf8","xfun","xml2")
workdir = r"(C:\Users\hj\Desktop)"
setwd(workdir)
pkgs <- sort(pkgs)
pkgs <- t(pkgs)
pkgs
write.table(pkgs, file = "pkgs.txt", row.names = F, col.names = F, sep = ",")

