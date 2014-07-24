data <- read.csv("currentcost_increase_load_compute02.csv", header=FALSE)

compute01 <- data[data$V5 == '1',]
compute02 <- data[data$V5 == '2',]
compute03 <- data[data$V5 == '3',]
compute04 <- data[data$V5 == '4',]


postscript("currentcost_increase_load_compute02.eps")

plot(compute02$V8, ylab="", xlab="", type="l",col="blue",ylim=c(0,300), lwd=3, xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute02$V3)[1], levels(compute04$V3)[86], levels(compute04$V3)[172], levels(compute04$V3)[258], levels(compute01$V3)[343])
text(c(0, 23, 46, 69, 91), par("usr")[3]-7,srt=45,adj=1,labels=lab,xpd=TRUE, cex=1.8)

abline(h = 222, v = 28, col = "gray70", lwd=2, lty=3)

abline(h = 221, v = 64, col = "orange", lwd=2, lty=2)

abline(h = 247, v = 82, col = "brown", lwd=2, lty=6)

dev.off()
