pkgs = c("affy","beeswarm","biomaRt","caret","lme4","xml2","pbkrtest","gridtext",
         "checkmate","ChIPseeker","clusterProfiler","colorspace","digest",
         "DOSE","dplyr","edgeR","enrichplot","foreign","ggpubr","ggtext",
         "ggplot2","ggpmisc","ggpubr","GOplot","gower","car","rstatix",
         "gplots","igraph","impute","ipred","limma","tcltk","utf8","xfun",
         "org.Hs.eg.db","org.Mm.eg.db","plotly","ReactomePA","rms",
         "stringi","stringr","survival","survivalROC","survminer")
install.packages("BiocManager", repo = "https://mirrors.sustech.edu.cn/CRAN/")
BiocManager::install(pkgs, update = FALSE, site_repository = "https://mirrors.sustech.edu.cn/CRAN/")
dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE)
lapply(pkgs, require, character.only = TRUE)




#安装软件包，个人安装的包在C:\Users\hj\AppData\Local\R\win-library\4.3
