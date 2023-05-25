#安装软件包
#要用管理员权限在CMD中安装，不能在RStiodio运行


pkgs = c("BiocManager", "colorspace", "stringi", "ggplot2", "gplots", "ggpubr", "ggpmisc", "GOplot", "digest", "stringr",
         "rms", "foreign", "survival", "survminer", "survivalROC", "beeswarm", "caret", "plotly", "gower", "xfun",
         "dplyr", "utf8", "ipred", "checkmate", "igraph", "tcltk")
lapply(pkgs, require, character.only = TRUE)
install.packages(pkgs, repo = "https://mirrors.sustech.edu.cn/CRAN/")


pkgs = c("DOSE", "clusterProfiler", "enrichplot", "org.Hs.eg.db", "org.Mm.eg.db", "impute", "limma", "biomaRt", "edgeR", "affy", "ChIPseeker", "ReactomePA")
BiocManager::install(pkgs, update = TRUE, ask = FALSE, site_repository = "https://mirrors.sustech.edu.cn/CRAN/")




