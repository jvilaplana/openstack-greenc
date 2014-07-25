data <- read.csv("currentcost_test2_redone_default.csv", header=FALSE)

compute01 <- data[data$V5 == '1',]
compute02 <- data[data$V5 == '2',]
compute03 <- data[data$V5 == '3',]
compute04 <- data[data$V5 == '4',]

postscript("currentcost_test2_redone_default.eps")

plot(compute01$V8, ylab="", xlab="", type="l",col="blue",ylim=c(0,300), lwd=1,xaxt="n", cex.axis=1.4, cex.lab=1.4)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute01$V3)[1], levels(compute01$V3)[155], levels(compute01$V3)[310], levels(compute01$V3)[465], levels(compute01$V3)[619])
text(c(0, 46.25, 92.5, 138.75, 185), par("usr")[3]-7,srt=45,adj=1,labels=lab,xpd=TRUE, cex=1.4)
lines(compute04$V8,col="orange", lwd=2)
lines(compute03$V8,col="green", lwd=2)
lines(compute02$V8,col="red", lwd=2)

dev.off()


postscript("currentcost_test2_redone_default_compute01.eps")

plot(compute01$V8, ylab="", xlab="", type="l",col="blue",ylim=c(0,300), lwd=3,xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
text(c(0, 46.25, 92.5, 138.75, 185), par("usr")[3]-7,srt=45,adj=1,labels=lab,xpd=TRUE, cex=1.4)

dev.off()


postscript("currentcost_test2_redone_default_compute02.eps")

plot(compute02$V8, ylab="", xlab="", type="l",col="red",ylim=c(0,300), lwd=3,xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
text(c(0, 46.25, 92.5, 138.75, 185), par("usr")[3]-7,srt=45,adj=1,labels=lab,xpd=TRUE, cex=1.4)

dev.off()


postscript("currentcost_test2_redone_default_compute03.eps")

plot(compute03$V8, ylab="", xlab="", type="l",col="green",ylim=c(0,300), lwd=3,xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
text(c(0, 46.25, 92.5, 138.75, 185), par("usr")[3]-7,srt=45,adj=1,labels=lab,xpd=TRUE, cex=1.4)

dev.off()


postscript("currentcost_test2_redone_default_compute04.eps")

plot(compute04$V8, ylab="", xlab="", type="l",col="orange",ylim=c(0,300), lwd=3,xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
text(c(0, 40, 80, 120, 160), par("usr")[3]-7,srt=45,adj=1,labels=lab,xpd=TRUE, cex=1.4)

dev.off()
