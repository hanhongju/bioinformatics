#安装软件包
#要用管理员权限在CMD中安装，不能在RStiodio运行
pkgs = c("BiocManager", "colorspace", "stringi", "ggplot2", "gplots", "ggpubr", "ggpmisc", "GOplot", "digest", "stringr",
         "rms", "foreign", "survival", "survminer", "survivalROC", "beeswarm", "caret", "plotly", "gower", "xfun",
         "dplyr", "org.Hs.eg.db", "org.Mm.eg.db", "utf8", "ipred", "checkmate", "igraph")
lapply(pkgs, require, character.only = TRUE)
install.packages(pkgs, type = "source", repo = "https://mirrors.sustech.edu.cn/CRAN/")


pkgs = c("DOSE", "clusterProfiler", "enrichplot", "org.Hs.eg.db", "org.Mm.eg.db", "impute", "limma", "biomaRt", "edgeR", "affy",
         "tcltk", "ChIPseeker", "ReactomePA")
BiocManager::install(pkgs, update = TRUE, ask = FALSE, type = "source", repo = "https://mirrors.sustech.edu.cn/CRAN/")


lapply(pkgs, require, character.only = TRUE)
install.packages(pkgs, type = "win.binary", repo = "https://mirrors.sustech.edu.cn/CRAN/")
