#安装软件包

pkgs = c("BiocManager", "colorspace", "stringi", "ggplot2", "gplots", "ggpubr", "ggpmisc", "GOplot", "digest", "stringr",
         "rms", "foreign", "survival", "survminer", "survivalROC", "beeswarm", "caret", "plotly", "gower", "xfun",
         "dplyr", "utf8", "ipred", "checkmate", "igraph", "tcltk", "DOSE", "clusterProfiler", "enrichplot", "org.Hs.eg.db",
         "org.Mm.eg.db", "impute", "limma", "biomaRt", "edgeR", "affy", "ChIPseeker", "ReactomePA")
lapply(pkgs, require, character.only = TRUE)
install.packages(pkgs, repo = "https://mirrors.sustech.edu.cn/CRAN/")
BiocManager::install(pkgs, update = TRUE, ask = FALSE, site_repository = "https://mirrors.sustech.edu.cn/CRAN/")




