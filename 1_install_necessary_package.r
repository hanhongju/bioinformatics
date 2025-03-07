# 在R中安装包前先将系统软件升级到最新：
# apt -y update && DEBIAN_FRONTEND=noninteractive apt -y full-upgrade && apt -y autoremove
# shell中 sudo R 后获取管理员权限
Sys.setenv("https_proxy"="socks5://127.0.0.1:8000")
options(repos = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/")
options(BioC_mirror = "https://mirrors.tuna.tsinghua.edu.cn/bioconductor/")
pkgs = c("affy","beeswarm","biomaRt","caret","lme4","xml2","pbkrtest","gridtext",
         "checkmate","ChIPseeker","clusterProfiler","colorspace","digest",
         "DOSE","dplyr","edgeR","enrichplot","foreign","ggpubr","ggtext",
         "ggplot2","ggpmisc","ggpubr","GOplot","gower","car","rstatix",
         "gplots","igraph","impute","ipred","limma","tcltk","utf8","xfun",
         "org.Hs.eg.db","org.Mm.eg.db","plotly","ReactomePA","rms",
         "stringi","stringr","survival","survivalROC","survminer")
# Windows中从源码编译需要安装rtools
update.packages(ask = FALSE, type = "source")
if (!require("BiocManager")) install.packages("BiocManager")
BiocManager::install(pkgs, ask = FALSE, type = "source")




# 获取管理员权限后系统库安装位置:
# C:\Program Files\R\R-4.4.3\library\ @ Windows 10
# /usr/local/lib/R/site-library/ @ Ubuntu 24 LTS
# 参考文献：
# https://github.com/bionoob7/bionoob7.github.io/issues/9
# https://stackoverflow.com/questions/20587440/some-r-packages-do-not-update-with-update-packages
