data <- read.csv("currentcost_c04_down.csv", header=FALSE)

compute01 <- data[data$V5 == '1',]
compute02 <- data[data$V5 == '2',]
compute03 <- data[data$V5 == '3',]
compute04 <- data[data$V5 == '4',]

postscript("currentcost_c04_down.eps")

plot(compute01$V8, ylab="", xlab="", type="l",col="blue",ylim=c(0,245), lwd=1,xaxt="n", cex.axis=1.4, cex.lab=1.4)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute01$V3)[1], levels(compute01$V3)[230], levels(compute01$V3)[459])
text(c(0, 68, 137), par("usr")[3]-7,srt=45,adj=1,labels=lab,xpd=TRUE, cex=1.4)
lines(compute04$V8,col="orange", lwd=2)
lines(compute03$V8,col="green", lwd=2)
lines(compute02$V8,col="red", lwd=2)

dev.off()


postscript("currentcost_c04_down_compute01.eps")

plot(compute01$V8, ylab="", xlab="", type="l",col="blue",ylim=c(0,245), lwd=3,xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute01$V3)[1], levels(compute01$V3)[230], levels(compute01$V3)[459])
text(c(0, 68, 137), par("usr")[3]-7,srt=45,adj=1,labels=lab,xpd=TRUE, cex=1.8)

dev.off()


postscript("currentcost_c04_down_compute02.eps")

plot(compute02$V8, ylab="", xlab="", type="l",col="red",ylim=c(0,245), lwd=3,xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute01$V3)[1], levels(compute01$V3)[230], levels(compute01$V3)[459])
text(c(0, 68, 137), par("usr")[3]-7,srt=45,adj=1,labels=lab,xpd=TRUE, cex=1.8)

dev.off()


postscript("currentcost_c04_down_compute03.eps")

plot(compute03$V8, ylab="", xlab="", type="l",col="green",ylim=c(0,245), lwd=3,xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute01$V3)[1], levels(compute01$V3)[230], levels(compute01$V3)[459])
text(c(0, 68, 137), par("usr")[3]-7,srt=45,adj=1,labels=lab,xpd=TRUE, cex=1.8)

dev.off()


postscript("currentcost_c04_down_compute04.eps")

plot(compute04$V8, ylab="", xlab="", type="l",col="orange",ylim=c(0,245), lwd=3,xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute01$V3)[1], levels(compute01$V3)[230], levels(compute01$V3)[459])
text(c(0, 68, 137), par("usr")[3]-7,srt=45,adj=1,labels=lab,xpd=TRUE, cex=1.8)

dev.off()
