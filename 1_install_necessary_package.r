# 在R中安装包前先将系统软件升级到最新：
# apt -y update && DEBIAN_FRONTEND=noninteractive apt -y full-upgrade && apt -y autoremove
# shell中 sudo R 后获取管理员权限并开始安装包
dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE)
.libPaths(Sys.getenv("R_LIBS_USER"))
options(repos = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/")
options(BioC_mirror = "https://mirrors.tuna.tsinghua.edu.cn/bioconductor/")
pkgs = c("affy","beeswarm","biomaRt","caret","lme4","xml2","pbkrtest","gridtext",
         "checkmate","ChIPseeker","clusterProfiler","colorspace","digest",
         "DOSE","dplyr","edgeR","enrichplot","foreign","ggpubr","ggtext",
         "ggplot2","ggpmisc","ggpubr","GOplot","gower","car","rstatix",
         "gplots","igraph","impute","ipred","limma","tcltk","utf8","xfun",
         "org.Hs.eg.db","org.Mm.eg.db","plotly","ReactomePA","rms",
         "stringi","stringr","survival","survivalROC","survminer")
update.packages(ask = FALSE, type = "source")
if (!require("BiocManager")) install.packages("BiocManager")
# windows中编译bioconductor包需要安装rtools
BiocManager::install(pkgs, ask = FALSE)
sapply(pkgs, require, character.only = TRUE)




# Windows中个人包安装位置在 C:\Users\hj\AppData\Local\R\win-library\4.4
# Ubuntu中系统包安装在 /usr/lib/R/library/
# 参考文献：
# https://github.com/bionoob7/bionoob7.github.io/issues/9
# https://stackoverflow.com/questions/20587440/some-r-packages-do-not-update-with-update-packages
