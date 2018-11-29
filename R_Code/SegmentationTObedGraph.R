setwd("/Users/arndtlab/Desktop/MAE/TilingArrayQuantileNormalizedData_3-10-17/tilingArray")
dir()

###Generate bedGraph files from Segmentation files###

##ALL Minus

#chr1
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"1.-")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrI", attributes(tilingData$"1.-")$x[i]-4, attributes(tilingData$"1.-")$x[i]+4, mean(attributes(tilingData$"1.-")$y[i,1:3]), mean(attributes(tilingData$"1.-")$y[i,4:6]), mean(attributes(tilingData$"1.-")$y[i,7:9]), mean(attributes(tilingData$"1.-")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr1.minus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr2
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"2.-")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrII", attributes(tilingData$"2.-")$x[i]-4, attributes(tilingData$"2.-")$x[i]+4, mean(attributes(tilingData$"2.-")$y[i,1:3]), mean(attributes(tilingData$"2.-")$y[i,4:6]), mean(attributes(tilingData$"2.-")$y[i,7:9]), mean(attributes(tilingData$"2.-")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr2.minus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr3
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"3.-")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrIII", attributes(tilingData$"3.-")$x[i]-4, attributes(tilingData$"3.-")$x[i]+4, mean(attributes(tilingData$"3.-")$y[i,1:3]), mean(attributes(tilingData$"3.-")$y[i,4:6]), mean(attributes(tilingData$"3.-")$y[i,7:9]), mean(attributes(tilingData$"3.-")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr3.minus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr4
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"4.-")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrIV", attributes(tilingData$"4.-")$x[i]-4, attributes(tilingData$"4.-")$x[i]+4, mean(attributes(tilingData$"4.-")$y[i,1:3]), mean(attributes(tilingData$"4.-")$y[i,4:6]), mean(attributes(tilingData$"4.-")$y[i,7:9]), mean(attributes(tilingData$"4.-")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr4.minus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr5
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"5.-")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrV", attributes(tilingData$"5.-")$x[i]-4, attributes(tilingData$"5.-")$x[i]+4, mean(attributes(tilingData$"5.-")$y[i,1:3]), mean(attributes(tilingData$"5.-")$y[i,4:6]), mean(attributes(tilingData$"5.-")$y[i,7:9]), mean(attributes(tilingData$"5.-")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr5.minus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr6
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"6.-")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrVI", attributes(tilingData$"6.-")$x[i]-4, attributes(tilingData$"6.-")$x[i]+4, mean(attributes(tilingData$"6.-")$y[i,1:3]), mean(attributes(tilingData$"6.-")$y[i,4:6]), mean(attributes(tilingData$"6.-")$y[i,7:9]), mean(attributes(tilingData$"6.-")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr6.minus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr7
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"7.-")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrVII", attributes(tilingData$"7.-")$x[i]-4, attributes(tilingData$"7.-")$x[i]+4, mean(attributes(tilingData$"7.-")$y[i,1:3]), mean(attributes(tilingData$"7.-")$y[i,4:6]), mean(attributes(tilingData$"7.-")$y[i,7:9]), mean(attributes(tilingData$"7.-")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr7.minus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr8
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"8.-")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrVIII", attributes(tilingData$"8.-")$x[i]-4, attributes(tilingData$"8.-")$x[i]+4, mean(attributes(tilingData$"8.-")$y[i,1:3]), mean(attributes(tilingData$"8.-")$y[i,4:6]), mean(attributes(tilingData$"8.-")$y[i,7:9]), mean(attributes(tilingData$"8.-")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr8.minus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr9
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"9.-")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrIX", attributes(tilingData$"9.-")$x[i]-4, attributes(tilingData$"9.-")$x[i]+4, mean(attributes(tilingData$"9.-")$y[i,1:3]), mean(attributes(tilingData$"9.-")$y[i,4:6]), mean(attributes(tilingData$"9.-")$y[i,7:9]), mean(attributes(tilingData$"9.-")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr9.minus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr10
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"10.-")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrX", attributes(tilingData$"10.-")$x[i]-4, attributes(tilingData$"10.-")$x[i]+4, mean(attributes(tilingData$"10.-")$y[i,1:3]), mean(attributes(tilingData$"10.-")$y[i,4:6]), mean(attributes(tilingData$"10.-")$y[i,7:9]), mean(attributes(tilingData$"10.-")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr10.minus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr11
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"11.-")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrXI", attributes(tilingData$"11.-")$x[i]-4, attributes(tilingData$"11.-")$x[i]+4, mean(attributes(tilingData$"11.-")$y[i,1:3]), mean(attributes(tilingData$"11.-")$y[i,4:6]), mean(attributes(tilingData$"11.-")$y[i,7:9]), mean(attributes(tilingData$"11.-")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr11.minus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr12
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"12.-")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrXII", attributes(tilingData$"12.-")$x[i]-4, attributes(tilingData$"12.-")$x[i]+4, mean(attributes(tilingData$"12.-")$y[i,1:3]), mean(attributes(tilingData$"12.-")$y[i,4:6]), mean(attributes(tilingData$"12.-")$y[i,7:9]), mean(attributes(tilingData$"12.-")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr12.minus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr13
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"13.-")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrXIII", attributes(tilingData$"13.-")$x[i]-4, attributes(tilingData$"13.-")$x[i]+4, mean(attributes(tilingData$"13.-")$y[i,1:3]), mean(attributes(tilingData$"13.-")$y[i,4:6]), mean(attributes(tilingData$"13.-")$y[i,7:9]), mean(attributes(tilingData$"13.-")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr13.minus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr14
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"14.-")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrXIV", attributes(tilingData$"14.-")$x[i]-4, attributes(tilingData$"14.-")$x[i]+4, mean(attributes(tilingData$"14.-")$y[i,1:3]), mean(attributes(tilingData$"14.-")$y[i,4:6]), mean(attributes(tilingData$"14.-")$y[i,7:9]), mean(attributes(tilingData$"14.-")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr14.minus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr15
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"15.-")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrXV", attributes(tilingData$"15.-")$x[i]-4, attributes(tilingData$"15.-")$x[i]+4, mean(attributes(tilingData$"15.-")$y[i,1:3]), mean(attributes(tilingData$"15.-")$y[i,4:6]), mean(attributes(tilingData$"15.-")$y[i,7:9]), mean(attributes(tilingData$"15.-")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr15.minus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr16
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"16.-")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrXVI", attributes(tilingData$"16.-")$x[i]-4, attributes(tilingData$"16.-")$x[i]+4, mean(attributes(tilingData$"16.-")$y[i,1:3]), mean(attributes(tilingData$"16.-")$y[i,4:6]), mean(attributes(tilingData$"16.-")$y[i,7:9]), mean(attributes(tilingData$"16.-")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr16.minus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr17 = mitochondrial
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"17.-")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrM", attributes(tilingData$"17.-")$x[i]-4, attributes(tilingData$"17.-")$x[i]+4, mean(attributes(tilingData$"17.-")$y[i,1:3]), mean(attributes(tilingData$"17.-")$y[i,4:6]), mean(attributes(tilingData$"17.-")$y[i,7:9]), mean(attributes(tilingData$"17.-")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr17.minus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


################################################################################################################################################################################################################################################################################################
################################################################################################################################################################################################################################################################################################
################################################################################################################################################################################################################################################################################################

##ALL Plus

#chr1
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"1.+")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrI", attributes(tilingData$"1.+")$x[i]-4, attributes(tilingData$"1.+")$x[i]+4, mean(attributes(tilingData$"1.+")$y[i,1:3]), mean(attributes(tilingData$"1.+")$y[i,4:6]), mean(attributes(tilingData$"1.+")$y[i,7:9]), mean(attributes(tilingData$"1.+")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr1.plus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr2
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"2.+")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrII", attributes(tilingData$"2.+")$x[i]-4, attributes(tilingData$"2.+")$x[i]+4, mean(attributes(tilingData$"2.+")$y[i,1:3]), mean(attributes(tilingData$"2.+")$y[i,4:6]), mean(attributes(tilingData$"2.+")$y[i,7:9]), mean(attributes(tilingData$"2.+")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr2.plus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr3
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"3.+")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrIII", attributes(tilingData$"3.+")$x[i]-4, attributes(tilingData$"3.+")$x[i]+4, mean(attributes(tilingData$"3.+")$y[i,1:3]), mean(attributes(tilingData$"3.+")$y[i,4:6]), mean(attributes(tilingData$"3.+")$y[i,7:9]), mean(attributes(tilingData$"3.+")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr3.plus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr4
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"4.+")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrIV", attributes(tilingData$"4.+")$x[i]-4, attributes(tilingData$"4.+")$x[i]+4, mean(attributes(tilingData$"4.+")$y[i,1:3]), mean(attributes(tilingData$"4.+")$y[i,4:6]), mean(attributes(tilingData$"4.+")$y[i,7:9]), mean(attributes(tilingData$"4.+")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr4.plus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr5
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"5.+")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrV", attributes(tilingData$"5.+")$x[i]-4, attributes(tilingData$"5.+")$x[i]+4, mean(attributes(tilingData$"5.+")$y[i,1:3]), mean(attributes(tilingData$"5.+")$y[i,4:6]), mean(attributes(tilingData$"5.+")$y[i,7:9]), mean(attributes(tilingData$"5.+")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr5.plus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr6
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"6.+")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrVI", attributes(tilingData$"6.+")$x[i]-4, attributes(tilingData$"6.+")$x[i]+4, mean(attributes(tilingData$"6.+")$y[i,1:3]), mean(attributes(tilingData$"6.+")$y[i,4:6]), mean(attributes(tilingData$"6.+")$y[i,7:9]), mean(attributes(tilingData$"6.+")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr6.plus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr7
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"7.+")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrVII", attributes(tilingData$"7.+")$x[i]-4, attributes(tilingData$"7.+")$x[i]+4, mean(attributes(tilingData$"7.+")$y[i,1:3]), mean(attributes(tilingData$"7.+")$y[i,4:6]), mean(attributes(tilingData$"7.+")$y[i,7:9]), mean(attributes(tilingData$"7.+")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr7.plus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr8
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"8.+")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrVIII", attributes(tilingData$"8.+")$x[i]-4, attributes(tilingData$"8.+")$x[i]+4, mean(attributes(tilingData$"8.+")$y[i,1:3]), mean(attributes(tilingData$"8.+")$y[i,4:6]), mean(attributes(tilingData$"8.+")$y[i,7:9]), mean(attributes(tilingData$"8.+")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr8.plus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr9
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"9.+")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrIX", attributes(tilingData$"9.+")$x[i]-4, attributes(tilingData$"9.+")$x[i]+4, mean(attributes(tilingData$"9.+")$y[i,1:3]), mean(attributes(tilingData$"9.+")$y[i,4:6]), mean(attributes(tilingData$"9.+")$y[i,7:9]), mean(attributes(tilingData$"9.+")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr9.plus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr10
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"10.+")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrX", attributes(tilingData$"10.+")$x[i]-4, attributes(tilingData$"10.+")$x[i]+4, mean(attributes(tilingData$"10.+")$y[i,1:3]), mean(attributes(tilingData$"10.+")$y[i,4:6]), mean(attributes(tilingData$"10.+")$y[i,7:9]), mean(attributes(tilingData$"10.+")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr10.plus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr11
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"11.+")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrXI", attributes(tilingData$"11.+")$x[i]-4, attributes(tilingData$"11.+")$x[i]+4, mean(attributes(tilingData$"11.+")$y[i,1:3]), mean(attributes(tilingData$"11.+")$y[i,4:6]), mean(attributes(tilingData$"11.+")$y[i,7:9]), mean(attributes(tilingData$"11.+")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr11.plus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr12
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"12.+")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrXII", attributes(tilingData$"12.+")$x[i]-4, attributes(tilingData$"12.+")$x[i]+4, mean(attributes(tilingData$"12.+")$y[i,1:3]), mean(attributes(tilingData$"12.+")$y[i,4:6]), mean(attributes(tilingData$"12.+")$y[i,7:9]), mean(attributes(tilingData$"12.+")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr12.plus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr13
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"13.+")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrXIII", attributes(tilingData$"13.+")$x[i]-4, attributes(tilingData$"13.+")$x[i]+4, mean(attributes(tilingData$"13.+")$y[i,1:3]), mean(attributes(tilingData$"13.+")$y[i,4:6]), mean(attributes(tilingData$"13.+")$y[i,7:9]), mean(attributes(tilingData$"13.+")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr13.plus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr14
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"14.+")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrXIV", attributes(tilingData$"14.+")$x[i]-4, attributes(tilingData$"14.+")$x[i]+4, mean(attributes(tilingData$"14.+")$y[i,1:3]), mean(attributes(tilingData$"14.+")$y[i,4:6]), mean(attributes(tilingData$"14.+")$y[i,7:9]), mean(attributes(tilingData$"14.+")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr14.plus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr15
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"15.+")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrXV", attributes(tilingData$"15.+")$x[i]-4, attributes(tilingData$"15.+")$x[i]+4, mean(attributes(tilingData$"15.+")$y[i,1:3]), mean(attributes(tilingData$"15.+")$y[i,4:6]), mean(attributes(tilingData$"15.+")$y[i,7:9]), mean(attributes(tilingData$"15.+")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr15.plus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr16
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"16.+")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrXVI", attributes(tilingData$"16.+")$x[i]-4, attributes(tilingData$"16.+")$x[i]+4, mean(attributes(tilingData$"16.+")$y[i,1:3]), mean(attributes(tilingData$"16.+")$y[i,4:6]), mean(attributes(tilingData$"16.+")$y[i,7:9]), mean(attributes(tilingData$"16.+")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr16.plus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)


#chr17 = mitochondrial
cnt=0
x=NULL

for(i in 1:length(attributes(tilingData$"17.+")$x)) {
  cnt.out=cnt+i
  print(cnt.out)
  x.out=cbind("chrM", attributes(tilingData$"17.+")$x[i]-4, attributes(tilingData$"17.+")$x[i]+4, mean(attributes(tilingData$"17.+")$y[i,1:3]), mean(attributes(tilingData$"17.+")$y[i,4:6]), mean(attributes(tilingData$"17.+")$y[i,7:9]), mean(attributes(tilingData$"17.+")$y[i,10:12]))
  x=rbind(x, x.out)
}

write.table(x, file="chr17.plus.txt", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)

##################################################################################################################################

###Read in all the files we just made###

#First I changed chr1 to chrI ect. in text a editer##

head(attributes(tilingData$"1.-")$y[i,1:3])
head(attributes(tilingData$"1.-")$y[i,4:6])
head(attributes(tilingData$"1.-")$y[i,7:9])
head(attributes(tilingData$"1.-")$y[i,10:12])

chr1.m=read.delim("chr1.minus.txt", header=F)
chr2.m=read.delim("chr2.minus.txt", header=F)
chr3.m=read.delim("chr3.minus.txt", header=F)
chr4.m=read.delim("chr4.minus.txt", header=F)
chr5.m=read.delim("chr5.minus.txt", header=F)
chr6.m=read.delim("chr6.minus.txt", header=F)
chr7.m=read.delim("chr7.minus.txt", header=F)
chr8.m=read.delim("chr8.minus.txt", header=F)
chr9.m=read.delim("chr9.minus.txt", header=F)
chr10.m=read.delim("chr10.minus.txt", header=F)
chr11.m=read.delim("chr11.minus.txt", header=F)
chr12.m=read.delim("chr12.minus.txt", header=F)
chr13.m=read.delim("chr13.minus.txt", header=F)
chr14.m=read.delim("chr14.minus.txt", header=F)
chr15.m=read.delim("chr15.minus.txt", header=F)
chr16.m=read.delim("chr16.minus.txt", header=F)
chrmt.m=read.delim("chr17.minus.txt", header=F)


chr1.p=read.delim("chr1.plus.txt", header=F)
chr2.p=read.delim("chr2.plus.txt", header=F)
chr3.p=read.delim("chr3.plus.txt", header=F)
chr4.p=read.delim("chr4.plus.txt", header=F)
chr5.p=read.delim("chr5.plus.txt", header=F)
chr6.p=read.delim("chr6.plus.txt", header=F)
chr7.p=read.delim("chr7.plus.txt", header=F)
chr8.p=read.delim("chr8.plus.txt", header=F)
chr9.p=read.delim("chr9.plus.txt", header=F)
chr10.p=read.delim("chr10.plus.txt", header=F)
chr11.p=read.delim("chr11.plus.txt", header=F)
chr12.p=read.delim("chr12.plus.txt", header=F)
chr13.p=read.delim("chr13.plus.txt", header=F)
chr14.p=read.delim("chr14.plus.txt", header=F)
chr15.p=read.delim("chr15.plus.txt", header=F)
chr16.p=read.delim("chr16.plus.txt", header=F)
chrmt.p=read.delim("chr17.plus.txt", header=F)


all.m=rbind(chr1.m, chr2.m, chr3.m, chr4.m, chr5.m, chr6.m, chr7.m, chr8.m, chr9.m, chr10.m, chr11.m, chr12.m, chr13.m, chr14.m, chr15.m, chr16.m, chrmt.m)

all.p=rbind(chr1.p, chr2.p, chr3.p, chr4.p, chr5.p, chr6.p, chr7.p, chr8.p, chr9.p, chr10.p, chr11.p, chr12.p, chr13.p, chr14.p, chr15.p, chr16.p, chrmt.p)

rm(chr1.m, chr2.m, chr3.m, chr4.m, chr5.m, chr6.m, chr7.m, chr8.m, chr9.m, chr10.m, chr11.m, chr12.m, chr13.m, chr14.m, chr15.m, chr16.m, chrmt.m)
rm(chr1.p, chr2.p, chr3.p, chr4.p, chr5.p, chr6.p, chr7.p, chr8.p, chr9.p, chr10.p, chr11.p, chr12.p, chr13.p, chr14.p, chr15.p, chr16.p, chrmt.p)

colnames(all.m)=c("chromosome", "start", "end", "Paf1", "Trf4Paf1", "Trf4", "Wild")
colnames(all.p)=c("chromosome", "start", "end", "Paf1", "Trf4Paf1", "Trf4", "Wild")

Paf1.m=cbind(as.character(all.m$chromosome), all.m$start, all.m$end, all.m$Paf1)
Trf4Paf1.m=cbind(as.character(all.m$chromosome), all.m$start, all.m$end, all.m$Trf4Paf1)
Trf4.m=cbind(as.character(all.m$chromosome), all.m$start, all.m$end, all.m$Trf4)
Wild.m=cbind(as.character(all.m$chromosome), all.m$start, all.m$end, all.m$Wild)

Paf1.p=cbind(as.character(all.p$chromosome), all.p$start, all.p$end, all.p$Paf1)
Trf4Paf1.p=cbind(as.character(all.p$chromosome), all.p$start, all.p$end, all.p$Trf4Paf1)
Trf4.p=cbind(as.character(all.p$chromosome), all.p$start, all.p$end, all.p$Trf4)
Wild.p=cbind(as.character(all.p$chromosome), all.p$start, all.p$end, all.p$Wild)


setwd("/Users/arndtlab/Desktop/MAE/TilingArrayQuantileNormalizedData_3-10-17/bedGraph")
dir()


write.table(Paf1.m, file="Paf1.Minus.Strand.bedgraph", sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)
write.table(Trf4Paf1.m, file="Trf4Paf1.Minus.Strand.bedgraph", sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)
write.table(Trf4.m, file="Trf4.Minus.Strand.bedgraph", sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)
write.table(Wild.m, file="Wild.Minus.Strand.bedgraph", sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)

write.table(Paf1.p, file="Paf1.Plus.Strand.bedgraph", sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)
write.table(Trf4Paf1.p, file="Trf4Paf1.Plus.Strand.bedgraph", sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)
write.table(Trf4.p, file="Trf4.Plus.Strand.bedgraph", sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)
write.table(Wild.p, file="Wild.Plus.Strand.bedgraph", sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)





