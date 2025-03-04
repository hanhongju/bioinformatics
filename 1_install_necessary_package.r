dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE)
options(repos = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/")
options(BioC_mirror = "http://mirrors.tuna.tsinghua.edu.cn/bioconductor/")
pkgs = c("affy","beeswarm","biomaRt","caret","lme4","xml2","pbkrtest","gridtext",
         "checkmate","ChIPseeker","clusterProfiler","colorspace","digest",
         "DOSE","dplyr","edgeR","enrichplot","foreign","ggpubr","ggtext",
         "ggplot2","ggpmisc","ggpubr","GOplot","gower","car","rstatix",
         "gplots","igraph","impute","ipred","limma","tcltk","utf8","xfun",
         "org.Hs.eg.db","org.Mm.eg.db","plotly","ReactomePA","rms",
         "stringi","stringr","survival","survivalROC","survminer")
install.packages("BiocManager", INSTALL_opts = '--no-lock')
BiocManager::install(pkgs, update = FALSE, INSTALL_opts = '--no-lock')
lapply(pkgs, require, character.only = TRUE)




# 安装软件包，个人安装的包在:
# C:\Users\hj\AppData\Local\R\win-library\4.4 @ Windows
# /home/hj/R/x86_64-pc-linux-gnu-library/4.4 @ Ubuntu 24 LTS
