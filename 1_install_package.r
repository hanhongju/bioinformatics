# 在R中安装包前先将系统软件升级到最新
# shell中 sudo R 后获取管理员权限
# Comprehensive R Archive Network mirror sources
options(repos = "https://mirrors.nju.edu.cn/CRAN/")
# options(BioC_mirror="https://mirrors.nju.edu.cn/bioconductor/")
pkgs = c("affy","beeswarm","biomaRt","caret","lme4","xml2","pbkrtest","gridtext",
         "checkmate","ChIPseeker","clusterProfiler","colorspace","digest",
         "DOSE","dplyr","edgeR","enrichplot","foreign","ggpubr","ggtext",
         "ggplot2","ggpmisc","ggpubr","GOplot","gower","car","rstatix",
         "gplots","igraph","impute","ipred","limma","tcltk","utf8","xfun",
         "org.Hs.eg.db","org.Mm.eg.db","plotly","ReactomePA","rms",
         "stringi","stringr","survival","survivalROC","survminer")
# Windows中从源码编译需要安装rtools
update.packages(ask = FALSE, type = "source", INSTALL_opts = "--no-lock")
if (!require("BiocManager")) install.packages("BiocManager", INSTALL_opts = "--no-lock")
BiocManager::install(pkgs, ask = FALSE, type = "source", INSTALL_opts = "--no-lock")




# 获取管理员权限后系统库安装位置:
# C:\Program Files\R\R-4.4.3\library\ @ Windows 10
# /usr/local/lib/R/site-library/ @ Ubuntu 24 LTS
# 参考文献：
# https://github.com/bionoob7/bionoob7.github.io/issues/9
# https://stackoverflow.com/questions/20587440/some-r-packages-do-not-update-with-update-packages
# ustc.edu.cn源与官方源同步会出现问题，tuna.tsinghua.edu.cn源速度太慢，不要使用
