data <- read.csv("currentcost_stop_start_compute04.csv", header=FALSE)

compute01 <- data[data$V5 == '1',]
compute02 <- data[data$V5 == '2',]
compute03 <- data[data$V5 == '3',]
compute04 <- data[data$V5 == '4',]


postscript("currentcost_stop_start_compute04.eps")

plot(compute04$V8, ylab="", xlab="", type="l",col="blue",ylim=c(0,300), lwd=3, xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute04$V3)[1], levels(compute04$V3)[91], levels(compute04$V3)[183], levels(compute04$V3)[274], levels(compute01$V3)[365])
text(c(0, 22, 44, 66, 88), par("usr")[3]-7,srt=45,adj=1,labels=lab,xpd=TRUE, cex=1.8)

dev.off()
