workdir = r"(C:\Users\hj\Desktop)"
setwd(workdir)
pkgs <- sort(pkgs)
pkgs <- t(pkgs)
pkgs
write.table(pkgs, file = "pkgs.txt", row.names = F, col.names = F, sep = ",")

