#安装软件包
#先使用require函数载入程序包以测试是否安装，library无法返回FALSE
if (!require("BiocManager"))       install.packages("BiocManager")
if (!require("colorspace"))        install.packages("colorspace")
if (!require("stringi"))           install.packages("stringi")
if (!require("ggplot2"))           install.packages("ggplot2")
if (!require("gplots"))            install.packages("gplots")
if (!require("ggpubr"))            install.packages("ggpubr")
if (!require("ggpmisc"))           install.packages("ggpmisc")
if (!require("GOplot"))            install.packages("GOplot")
if (!require("digest"))            install.packages("digest")
if (!require("stringr"))           install.packages("stringr")
if (!require("rms"))               install.packages("rms")
if (!require("foreign"))           install.packages("foreign")
if (!require("survival"))          install.packages("survival")
if (!require("survminer"))         install.packages("survminer")
if (!require("survivalROC"))       install.packages("survivalROC")
if (!require("beeswarm"))          install.packages("beeswarm")
if (!require("caret"))             install.packages("caret")
if (!require("plotly"))            install.packages("plotly")
if (!require("gower"))             install.packages("gower")
if (!require("xfun"))              install.packages("xfun")
if (!require("dplyr"))             install.packages("dplyr")
if (!require("org.Hs.eg.db"))      install.packages("org.Hs.eg.db")
if (!require("org.Mm.eg.db"))      install.packages("org.Mm.eg.db")
if (!require("utf8"))              install.packages("utf8")




#使用BiocManager安装非官方程序包
options("install.lock"=FALSE)
BiocManager::install("DOSE"             ,update=TRUE, ask=FALSE)
BiocManager::install("clusterProfiler"  ,update=TRUE, ask=FALSE)
BiocManager::install("enrichplot"       ,update=TRUE, ask=FALSE)
BiocManager::install("org.Hs.eg.db"     ,update=TRUE, ask=FALSE)
BiocManager::install("org.Mm.eg.db"     ,update=TRUE, ask=FALSE)
BiocManager::install("impute"           ,update=TRUE, ask=FALSE)
BiocManager::install("limma"            ,update=TRUE, ask=FALSE)
BiocManager::install("biomaRt"          ,update=TRUE, ask=FALSE)
BiocManager::install("edgeR"            ,update=TRUE, ask=FALSE)
BiocManager::install("affy"             ,update=TRUE, ask=FALSE)
BiocManager::install("tcltk"            ,update=TRUE, ask=FALSE)
BiocManager::install("ChIPseeker"       ,update=TRUE, ask=FALSE)



