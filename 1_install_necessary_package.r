pkgs = c("affy","beeswarm","BiocManager","biomaRt","caret",
         "checkmate","ChIPseeker","clusterProfiler","colorspace","digest",
         "DOSE","dplyr","edgeR","enrichplot","foreign",
         "ggplot2","ggpmisc","ggpubr","GOplot","gower",
         "gplots","igraph","impute","ipred","limma",
         "org.Hs.eg.db","org.Mm.eg.db","plotly","ReactomePA","rms",
         "stringi","stringr","survival","survivalROC","survminer",
         "tcltk","utf8","xfun")
lapply(pkgs, require, character.only = TRUE)
install.packages(pkgs, repo = "https://mirrors.sustech.edu.cn/CRAN/")
BiocManager::install(pkgs, update = FALSE,
                     site_repository = "https://mirrors.sustech.edu.cn/CRAN/")
dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE)




#安装软件包，个人安装的包在C:\Users\hj\AppData\Local\R\win-library\4.3
