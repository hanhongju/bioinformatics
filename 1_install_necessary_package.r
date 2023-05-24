#安装软件包
#要在R程序界面用管理员运行，不能在RStiodio运行，会安装不完全
pkgs = c("BiocManager", "colorspace", "stringi", "ggplot2", "gplots", "ggpubr", "ggpmisc", "GOplot", "digest", "stringr",
         "rms", "foreign", "survival", "survminer", "survivalROC", "beeswarm", "caret", "plotly", "gower", "xfun",
         "dplyr", "org.Hs.eg.db", "org.Mm.eg.db", "utf8", "ipred", "checkmate")
lapply(pkgs, require, character.only = TRUE)
install.packages(pkgs, type = "source")




#使用BiocManager安装非官方程序包
pkgs = c("DOSE", "clusterProfiler", "enrichplot", "org.Hs.eg.db", "org.Mm.eg.db", "impute", "limma", "biomaRt", "edgeR", "affy",
         "tcltk", "ChIPseeker", "ReactomePA")
BiocManager::install(pkgs, update = TRUE, ask = FALSE, type = "source")




