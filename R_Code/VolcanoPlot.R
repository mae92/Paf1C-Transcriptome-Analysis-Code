#######
##CHANGE ouput FILE FROM limma_Analysis.Annotated.Retions.R to seperate first column at the ; before and save as the fixed version before using this code
#######
setwd("/Users/mitchellellison/Desktop/PaperAnalysis2/Analysis.Annotated.Region")

dir()

pafvswt = read.csv("pafVSwt.all.fix.csv")
head(pafvswt)

for(i in 1:length(levels(pafvswt$feature))){
  
  j = levels(pafvswt$feature)[i]
  print(j)
  
  k = pafvswt[pafvswt$feature == j,]
  
  png(paste0("/Users/mitchellellison/Desktop/PaperAnalysis2/Analysis.Annotated.Region/", "pafvswt", j, ".png"), height = 400, width = 400)
  plot(k$logFC, -log10(k$adj.P.Val), cex = 0.8, pch = 16, ylim = c(0,3.2), xlim = c(-4,4), col="black", main = j)
  abline(h = -log10(0.05), lwd = 2)
  abline(v = log2(1.5), lwd = 2)
  abline(v = -log2(1.5), lwd = 2)
  dev.off() 
  
}


paftrfvstrf = read.csv("paftrfVStrf.all.fix.csv")
head(paftrfvstrf)

for(i in 1:length(levels(paftrfvstrf$feature))){
  
  j = levels(paftrfvstrf$feature)[i]
  print(j)
  
  k = paftrfvstrf[paftrfvstrf$feature == j,]
  
  png(paste0("/Users/mitchellellison/Desktop/PaperAnalysis2/Analysis.Annotated.Region/paftrfvstrf_plots/", "paftrfvstrf", j, ".png"), height = 400, width = 400)
  plot(k$logFC, -log10(k$adj.P.Val), cex = 0.8, pch = 16, ylim = c(0,3.2), xlim = c(-3.2,3.2), col="black", main = j)
  abline(h = -log10(0.05), lwd = 2)
  abline(v = log2(1.5), lwd = 2)
  abline(v = -log2(1.5), lwd = 2)
  dev.off() 
  
}




levels(paftrfvstrf$feature)

paftrfvstrf[paftrfvstrf$feature == "snRNA",]

paftrfvstrf[paftrfvstrf$feature == "snoRNA",]

png(paste0("/Users/mitchellellison/Desktop/PaperAnalysis2/Analysis.Annotated.Region/paftrfvstrf_plots/", "paftrfvstrf", "snRNA_snoRNA_combined", ".png"), height = 400, width = 400)
plot(paftrfvstrf[paftrfvstrf$feature == "snoRNA",]$logFC, -log10(paftrfvstrf[paftrfvstrf$feature == "snoRNA",]$adj.P.Val), cex = 0.8, pch = 16, ylim = c(0,3.2), xlim = c(-3.2,3.2), col="black", main = "snRNA + snoRNA")
points(paftrfvstrf[paftrfvstrf$feature == "snRNA",]$logFC, -log10(paftrfvstrf[paftrfvstrf$feature == "snRNA",]$adj.P.Val), cex = 0.8, pch = 16, col="red")
abline(h = -log10(0.05), lwd = 2)
abline(v = log2(1.5), lwd = 2)
abline(v = -log2(1.5), lwd = 2)
dev.off() 
