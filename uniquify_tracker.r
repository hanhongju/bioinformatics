workdir = r"(C:\Users\hj\Desktop)"
setwd(workdir)
inputFile = "tracker.txt"
data <- read.csv(inputFile, header = F)
uniquedata <- unique(data)
uniquedata <- t(uniquedata)
uniquedata_sorted <- sort(uniquedata)
write.table(uniquedata_sorted, file = "uniquetracker.txt",
            row.names = F, col.names = F, quote = F)




# 去除重复的tracker
