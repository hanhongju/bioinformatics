library(stringr)
workdir = r"(C:\Users\hj\Desktop)"
setwd(workdir)
inputFile = "todeldn.txt"
data <- read.csv(inputFile, header = F)
data$V1 <- gsub("&.*", "", data$V1)
write.table(data, file = "nodn.txt",
            row.names = F, col.names = F, quote = F)
