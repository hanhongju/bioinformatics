pkgs = ""
pkgslist <- strsplit(pkgs, " ")
pkgsvectorsorted <- sort(pkgslist[[1]])
pkgssorted <- paste(pkgsvectorsorted, collapse = " ")
pkgssorted
