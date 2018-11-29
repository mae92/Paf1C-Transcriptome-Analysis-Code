##Script Used for the Analysis of Tiling array data from Yeast (wt, paf1-, trf4-, & paf1-trf4-)
##load useful packages
library("tilingArray")
library("davidTiling")
library("RColorBrewer")
library("geneplotter")
library("grid")
library("affyPLM")
library("Starr")
library("limma")
library("marray")


##tilingArray##
###load probeAnno from davidTiling datapack##
load("~/Desktop/RDA_Files/probeAnno+GFF.rda")

whPM = PMindex(probeAnno)
whBG = BGindex(probeAnno)
length(whPM)
length(whBG)
all(whBG %in% whPM)

setwd("~/Desktop/CEL_Files")

cels=c("11_09_27_paf1.cel", "11_09_27_paf2.cel", "11_09_27_paf3.cel", "11_09_27_trf_paf1.cel", "11_09_27_trf_paf2.cel", "11_09_27_trf_paf3.cel", "11_09_27_trf1.cel", "11_09_27_trf2.cel", "11_09_27_trf3.cel", "11_09_27_wt1.cel", "11_09_27_wt2.cel", "11_09_27_wt3.cel")
names=c("Paf1-1", "Paf1-2", "Paf1-3", "Trf_Paf1-1", "Trf_Paf1-2", "Trf_Paf1-3", "Trf-1", "Trf-2", "Trf-3", "Wild-1", "Wild-2", "Wild-3")
type=c("paf1", "paf1", "paf1","trf_paf", "trf_paf", "trf_paf", "trf", "trf", "trf", "wt", "wt", "wt")

cel=readCel2eSet(filename=cels)
sampleNames(cel)=names
sampleNames(cel)
phenoData(cel)$varLabels=type
phenoData(cel)$varLabels

setwd("~/Desktop")

##log2 transform values in cel for plotting MA plots##
log2.cel = cel
exprs(log2.cel)=log2(exprs(cel))

head(exprs(log2.cel))

##limma##
##Variance Stabalized Normalization###
vsn <- normalizeVSN(cel)

##Add normalized log2 intensitys back into eSet##
vsn.cel = cel
exprs(vsn.cel)=vsn

head(exprs(vsn.cel))

##Starr##
##Boxplots NoNorm and Norm##
png("~/Desktop/Analysis/RAWdataboxdens.png", height=750, width=1000)
plotBoxes(exprs(log2.cel))
dev.off()

png("~/Desktop/Analysis/VSNnormdataboxdens.png", height=750, width=1000)
plotBoxes(exprs(vsn.cel))
dev.off()

##affyPLM##
##MA plotting NoNorm and Norm indepndant##
png("~/Desktop/Analysis/RAW_MA.png", height=1500, width=2000)
par(mfcol=c(3,4))
MAplot(log2.cel)
dev.off()

png("~/Desktop/Analysis/VSN_MA.png", height=1500, width=2000)
par(mfcol=c(3,4))
MAplot(vsn.cel)
dev.off()

##Standard R functions##
##Pre and Post quantile normalization PCA plots
##Maximum Likelihood Factor Analysis##
celPCA=factanal(exprs(log2.cel), factors=3, rotation="varimax")
print(celPCA, digits=2, cutoff=0.3, sort=T)
png("~/Desktop/Analysis/RAW_PCAmaxlikeFactAnaly.png", height=1000, width=1000)
plot(celPCA$loadings[,1:2], type="p")
text(celPCA$loadings[,1:2], labels=names(celPCA$uniquenesses), cex=1.5, pos=3)
dev.off()

vsnPCA=factanal(exprs(vsn.cel), factors=3, rotation="varimax")
print(vsnPCA, digits=2, cutoff=0.3, sort=T)
png("~/Desktop/Analysis/VSN_PCAmaxlikeFactAnaly.png", height=1000, width=1000)
plot(vsnPCA$loadings[,1:2], type="p")
text(vsnPCA$loadings[,1:2], labels=names(vsnPCA$uniquenesses), cex=1.5, pos=3)
dev.off()

##tilingArray##
##test##
tilingData=segChrom(vsn.cel, probeAnno=probeAnno, chr=1, strands=c("+", "-"), nrBasesPerSegment = 1500, savedir="~/Desktop/Analysis/Test")
rm(tilingData)


##Segmentation##
tilingData=segChrom(vsn.cel, probeAnno=probeAnno, chr=1:17, strands=c("+", "-"), nrBasesPerSegment = 1500, savedir="~/Desktop/Analysis/tilingData")


##Read Segmentation Files into R##
tilingData=new.env()
#chr1
load("~/Desktop/Analysis/tilingData/1.-.rda")
tilingData$"1.-"=s
load("~/Desktop/Analysis/tilingData/1.+.rda")
tilingData$"1.+"=s
#chr2
load("~/Desktop/Analysis/tilingData/2.-.rda")
tilingData$"2.-"=s
load("~/Desktop/Analysis/tilingData/2.+.rda")
tilingData$"2.+"=s
#chr3
load("~/Desktop/Analysis/tilingData/3.-.rda")
tilingData$"3.-"=s
load("~/Desktop/Analysis/tilingData/3.+.rda")
tilingData$"3.+"=s
#chr4
load("~/Desktop/Analysis/tilingData/4.-.rda")
tilingData$"4.-"=s
load("~/Desktop/Analysis/tilingData/4.+.rda")
tilingData$"4.+"=s
#chr5
load("~/Desktop/Analysis/tilingData/5.-.rda")
tilingData$"5.-"=s
load("~/Desktop/Analysis/tilingData/5.+.rda")
tilingData$"5.+"=s
#chr6
load("~/Desktop/Analysis/tilingData/6.-.rda")
tilingData$"6.-"=s
load("~/Desktop/Analysis/tilingData/6.+.rda")
tilingData$"6.+"=s
#chr7
load("~/Desktop/Analysis/tilingData/7.-.rda")
tilingData$"7.-"=s
load("~/Desktop/Analysis/tilingData/7.+.rda")
tilingData$"7.+"=s
#chr8
load("~/Desktop/Analysis/tilingData/8.-.rda")
tilingData$"8.-"=s
load("~/Desktop/Analysis/tilingData/8.+.rda")
tilingData$"8.+"=s
#chr9
load("~/Desktop/Analysis/tilingData/9.-.rda")
tilingData$"9.-"=s
load("~/Desktop/Analysis/tilingData/9.+.rda")
tilingData$"9.+"=s
#chr10
load("~/Desktop/Analysis/tilingData/10.-.rda")
tilingData$"10.-"=s
load("~/Desktop/Analysis/tilingData/10.+.rda")
tilingData$"10.+"=s
#chr11
load("~/Desktop/Analysis/tilingData/11.-.rda")
tilingData$"11.-"=s
load("~/Desktop/Analysis/tilingData/11.+.rda")
tilingData$"11.+"=s
#chr12
load("~/Desktop/Analysis/tilingData/12.-.rda")
tilingData$"12.-"=s
load("~/Desktop/Analysis/tilingData/12.+.rda")
tilingData$"12.+"=s
#chr13
load("~/Desktop/Analysis/tilingData/13.-.rda")
tilingData$"13.-"=s
load("~/Desktop/Analysis/tilingData/13.+.rda")
tilingData$"13.+"=s
#chr14
load("~/Desktop/Analysis/tilingData/14.-.rda")
tilingData$"14.-"=s
load("~/Desktop/Analysis/tilingData/14.+.rda")
tilingData$"14.+"=s
#chr15
load("~/Desktop/Analysis/tilingData/15.-.rda")
tilingData$"15.-"=s
load("~/Desktop/Analysis/tilingData/15.+.rda")
tilingData$"15.+"=s
#chr16
load("~/Desktop/Analysis/tilingData/16.-.rda")
tilingData$"16.-"=s
load("~/Desktop/Analysis/tilingData/16.+.rda")
tilingData$"16.+"=s
#chr17
load("~/Desktop/Analysis/tilingData/17.-.rda")
tilingData$"17.-"=s
load("~/Desktop/Analysis/tilingData/17.+.rda")
tilingData$"17.+"=s

rm(s)







