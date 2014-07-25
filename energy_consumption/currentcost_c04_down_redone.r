data <- read.csv("currentcost_test2_redone.csv", header=FALSE)

compute01 <- data[data$V5 == '1',]
compute02 <- data[data$V5 == '2',]
compute03 <- data[data$V5 == '3',]
compute04 <- data[data$V5 == '4',]

postscript("currentcost_test2_redone.eps")

plot(compute01$V8, ylab="", xlab="", type="l",col="blue",ylim=c(0,245), lwd=1,xaxt="n", cex.axis=1.4, cex.lab=1.4)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute01$V3)[1], levels(compute01$V3)[230], levels(compute01$V3)[459])
text(c(0, 68, 137), par("usr")[3]-7,srt=45,adj=1,labels=lab,xpd=TRUE, cex=1.4)
lines(compute04$V8,col="orange", lwd=2)
lines(compute03$V8,col="green", lwd=2)
lines(compute02$V8,col="red", lwd=2)

dev.off()


postscript("currentcost_test2_redone_compute01.eps")

plot(compute01$V8, ylab="", xlab="", type="l",col="blue",ylim=c(0,245), lwd=3,xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute01$V3)[1], levels(compute01$V3)[321], levels(compute01$V3)[642], levels(compute01$V3)[963], levels(compute01$V3)[1284])
text(c(0, 82.5, 165, 247.5, 330), par("usr")[3]-7,srt=45,adj=1,labels=lab,xpd=TRUE, cex=1.8)

dev.off()


postscript("currentcost_test2_redone_compute02.eps")

plot(compute02$V8, ylab="", xlab="", type="l",col="red",ylim=c(0,245), lwd=3,xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute01$V3)[1], levels(compute01$V3)[321], levels(compute01$V3)[642], levels(compute01$V3)[963], levels(compute01$V3)[1284])
text(c(0, 82.5, 165, 247.5, 330), par("usr")[3]-7,srt=45,adj=1,labels=lab,xpd=TRUE, cex=1.8)

dev.off()


postscript("currentcost_test2_redone_compute03.eps")

plot(compute03$V8, ylab="", xlab="", type="l",col="green",ylim=c(0,245), lwd=3,xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute01$V3)[1], levels(compute01$V3)[321], levels(compute01$V3)[642], levels(compute01$V3)[963], levels(compute01$V3)[1284])
text(c(0, 82.5, 165, 247.5, 330), par("usr")[3]-7,srt=45,adj=1,labels=lab,xpd=TRUE, cex=1.8)

dev.off()


postscript("currentcost_test2_redone_compute04.eps")

plot(compute04$V8, ylab="", xlab="", type="l",col="orange",ylim=c(0,245), lwd=3,xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute01$V3)[1], levels(compute01$V3)[321], levels(compute01$V3)[642], levels(compute01$V3)[963], levels(compute01$V3)[1284])
text(c(0, 82.5, 165, 247.5, 330), par("usr")[3]-7,srt=45,adj=1,labels=lab,xpd=TRUE, cex=1.8)

dev.off()
