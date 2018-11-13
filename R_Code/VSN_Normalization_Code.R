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
load("/Users/arndtlab/Desktop/MAE/TilingArrayNormalizationTest/probeAnno+GFF.rda")

whPM = PMindex(probeAnno)
whBG = BGindex(probeAnno)
length(whPM)
length(whBG)
all(whBG %in% whPM)

setwd("/Users/arndtlab/Desktop/MAE/TilingArrayNormalizationTest/CEL_Files")

cels=c("11_09_27_paf1.cel", "11_09_27_paf2.cel", "11_09_27_paf3.cel", "11_09_27_trf_paf1.cel", "11_09_27_trf_paf2.cel", "11_09_27_trf_paf3.cel", "11_09_27_trf1.cel", "11_09_27_trf2.cel", "11_09_27_trf3.cel", "11_09_27_wt1.cel", "11_09_27_wt2.cel", "11_09_27_wt3.cel")
names=c("Paf1-1", "Paf1-2", "Paf1-3", "Trf_Paf1-1", "Trf_Paf1-2", "Trf_Paf1-3", "Trf-1", "Trf-2", "Trf-3", "Wild-1", "Wild-2", "Wild-3")
type=c("paf1", "paf1", "paf1","trf_paf", "trf_paf", "trf_paf", "trf", "trf", "trf", "wt", "wt", "wt")

cel=readCel2eSet(filename=cels)
sampleNames(cel)=names
sampleNames(cel)
phenoData(cel)$varLabels=type
phenoData(cel)$varLabels

setwd("/Users/arndtlab/Desktop/MAE/TilingArrayNormalizationTest/None")

##log2 transform values in cel for plotting MA plots##
log2.cel = cel
exprs(log2.cel)=log2(exprs(cel))

head(exprs(log2.cel))






####
####
####

setwd("/Users/arndtlab/Desktop/MAE/TilingArrayNormalizationTest/None")

##limma##
##Variance Stabalized Normalization###
None <- normalizeBetweenArrays(cel, method = "none")

##Add normalized log2 intensitys back into eSet##
None.cel = cel
exprs(None.cel)=None

head(exprs(None.cel))

##affyPLM##
##MA plotting NoNorm and Norm indepndant##
png("None_MA.png", height=1500, width=2000)
par(mfcol=c(3,4))
MAplot(None.cel)
dev.off()

##Standard R functions##
##Pre and Post quantile normalization PCA plots
##Maximum Likelihood Factor Analysis##
celPCA=factanal(exprs(None.cel), factors=3, rotation="varimax")
print(celPCA, digits=2, cutoff=0.3, sort=T)
png("None_PCA.png", height=700, width=700)
plot(celPCA$loadings[,1:2], type="p", col = c("blue", "blue", "blue", 
                                              "green", "green", "green", 
                                              "purple", "purple", "purple", 
                                              "black", "black", "black"), cex = 3, pch = 16)
text(celPCA$loadings[,1:2], labels=names(celPCA$uniquenesses), cex=1.5, pos=1)
dev.off()

png("None_biplot.png", height = 1000, width = 1000)
pairs(exprs(None.cel))
dev.off()








####
####
####

setwd("/Users/arndtlab/Desktop/MAE/TilingArrayNormalizationTest/VSN")

##limma##
##Variance Stabalized Normalization###
vsn <- normalizeVSN(cel)

##Add normalized log2 intensitys back into eSet##
vsn.cel = cel
exprs(vsn.cel)=vsn

head(exprs(vsn.cel))

##affyPLM##
##MA plotting NoNorm and Norm indepndant##
png("VSN_MA.png", height=1500, width=2000)
par(mfcol=c(3,4))
MAplot(vsn.cel)
dev.off()

##Standard R functions##
##Pre and Post quantile normalization PCA plots
##Maximum Likelihood Factor Analysis##
celPCA=factanal(exprs(vsn.cel), factors=3, rotation="varimax")
print(celPCA, digits=2, cutoff=0.3, sort=T)
png("VSN_PCA.png", height=700, width=700)
plot(celPCA$loadings[,1:2], type="p", col = c("blue", "blue", "blue", 
                                              "green", "green", "green", 
                                              "purple", "purple", "purple", 
                                              "black", "black", "black"), cex = 3, pch = 16)
text(celPCA$loadings[,1:2], labels=names(celPCA$uniquenesses), cex=1.5, pos=1)
dev.off()

png("VSN_biplot.png", height = 1000, width = 1000)
pairs(exprs(vsn.cel))
dev.off()



