data <- read.csv("currentcost_idle_1h.csv", header=FALSE)

compute01 <- data[data$V5 == '1',]
compute02 <- data[data$V5 == '2',]
compute03 <- data[data$V5 == '3',]
compute04 <- data[data$V5 == '4',]

postscript("currentcost_idle_1h.eps")

plot(compute01$V8, ylab="Watts", xlab="Time", type="l",col="blue",ylim=c(110,180), lwd=1,xaxt="n", cex.axis=1.4, cex.lab=1.4)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute01$V3)[1], levels(compute01$V3)[409], levels(compute01$V3)[818], levels(compute01$V3)[1227], levels(compute01$V3)[1636], levels(compute01$V3)[2044])
text(c(0, 109, 218, 336, 445, 545), par("usr")[3]-1.80,srt=0,adj=1,labels=lab,xpd=TRUE, cex=1.4)
lines(compute04$V8,col="orange", lwd=2)
lines(compute03$V8,col="green", lwd=2)
lines(compute02$V8,col="red", lwd=2)

dev.off()


postscript("currentcost_idle_1h_compute01.eps")

plot(compute01$V8, ylab="Watts", xlab="Time", type="l",col="blue",ylim=c(110,180), lwd=1,xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute01$V3)[1], levels(compute01$V3)[409], levels(compute01$V3)[818], levels(compute01$V3)[1227], levels(compute01$V3)[1636], levels(compute01$V3)[2044])
text(c(0, 109, 218, 336, 445, 545), par("usr")[3]-1.80,srt=0,adj=1,labels=lab,xpd=TRUE, cex=1.8)

dev.off()


postscript("currentcost_idle_1h_compute02.eps")

plot(compute02$V8, ylab="Watts", xlab="Time", type="l",col="red",ylim=c(110,180), lwd=1,xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute01$V3)[1], levels(compute01$V3)[409], levels(compute01$V3)[818], levels(compute01$V3)[1227], levels(compute01$V3)[1636], levels(compute01$V3)[2044])
text(c(0, 109, 218, 336, 445, 545), par("usr")[3]-1.80,srt=0,adj=1,labels=lab,xpd=TRUE, cex=1.8)

dev.off()


postscript("currentcost_idle_1h_compute03.eps")

plot(compute03$V8, ylab="Watts", xlab="Time", type="l",col="green",ylim=c(110,180), lwd=1,xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute01$V3)[1], levels(compute01$V3)[409], levels(compute01$V3)[818], levels(compute01$V3)[1227], levels(compute01$V3)[1636], levels(compute01$V3)[2044])
text(c(0, 109, 218, 336, 445, 545), par("usr")[3]-1.80,srt=0,adj=1,labels=lab,xpd=TRUE, cex=1.8)

dev.off()


postscript("currentcost_idle_1h_compute04.eps")

plot(compute04$V8, ylab="Watts", xlab="Time", type="l",col="orange",ylim=c(110,180), lwd=1,xaxt="n", cex.axis=1.8, cex.lab=1.8)
axis(1,labels=FALSE, tck=0)
lab <- c(levels(compute01$V3)[1], levels(compute01$V3)[409], levels(compute01$V3)[818], levels(compute01$V3)[1227], levels(compute01$V3)[1636], levels(compute01$V3)[2044])
text(c(0, 109, 218, 336, 445, 545), par("usr")[3]-1.80,srt=0,adj=1,labels=lab,xpd=TRUE, cex=1.8)

dev.off()
