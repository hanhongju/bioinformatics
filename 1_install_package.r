# 在R中安装包前先将系统软件升级到最新
# shell中 sudo R 后获取管理员权限
# Comprehensive R Archive Network mirror sources
options(repos = "https://mirrors.nju.edu.cn/CRAN/")
options(BioC_mirror="https://mirrors.nju.edu.cn/bioconductor/")
pkgs = c("affy","beeswarm","biomaRt","car","caret","checkmate","ChIPseeker","clusterProfiler"
         ,"colorspace","devtools","digest","DOSE","dplyr","dplyr","edgeR","ellipsis"
         ,"enrichplot","ggplot2","curl","packrat","rsconnect","ggpmisc","ggpubr","ggpubr"
         ,"ggsci","ggtext","GOplot","gower","gplots","gridtext","igraph","impute","ipred"
         ,"limma","lme4","monocle","openxlsx","org.Hs.eg.db","org.Mm.eg.db","pbkrtest","pkgbuild"
         ,"pkgload","plotly","profvis","ReactomePA","remotes","reticulate","rms","rstatix"
         ,"rtracklayer","nleqslv","sessioninfo","Seurat","stringi","stringr","survivalROC"
         ,"survminer","tidyverse","urlchecker","usethis","utf8","xfun","xml2")
# Windows中从源码编译需要安装rtools
if (!require("BiocManager")) install.packages("BiocManager", INSTALL_opts = "--no-lock")
BiocManager::install(pkgs, ask = FALSE, INSTALL_opts = "--no-lock", Ncpus = 6, type = "binary")
library("devtools")
install_github("immunogenomics/harmony")




# 获取管理员权限后系统库安装位置:
# C:\Program Files\R\R-4.5.0\library\ @ Windows 10
# /usr/local/lib/R/site-library/ @ Ubuntu 24 LTS
# 参考文献：
# https://github.com/bionoob7/bionoob7.github.io/issues/9
# https://stackoverflow.com/questions/20587440/some-r-packages-do-not-update-with-update-packages
# ustc.edu.cn源与官方源同步会出现问题，tuna.tsinghua.edu.cn源速度太慢，不要使用
