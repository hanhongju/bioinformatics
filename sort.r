pkgs = sort(pkgs)
pkgs = t(pkgs)
pkgs
write.table(pkgs, file = "pkgs.txt", sep = "," )
