#######
##CHANGE ouput FILE FROM limma_Analysis.Annotated.Retions.R to seperate first column at the ; before and save as the fixed version before using this code
#######
setwd("/Users/mitchellellison/Desktop/PaperAnalysis2/Analysis.Annotated.Region")

dir()

data.file = read.csv("All.RNA.biplotting.table.before.limma.fix.csv")
head(data.file)

for(i in 1:length(levels(data.file$feature))){
  
  j = levels(data.file$feature)[i]
  print(j)
  
  k = data.file[data.file$feature == j,]
  
  png(paste0("/Users/mitchellellison/Desktop/PaperAnalysis2/Analysis.Annotated.Region/pafvswt_plots/", "Biplot.paf1vswt", j, ".png"), height = 400, width = 400)
  plot(k$WT.mean, k$paf1D.mean, cex = 0.8, pch = 16, ylim = c(6,16), xlim = c(6,16), col=rgb(0,0,0,0.3))
  abline(a = 0, b = 1, lwd = 2)
  dev.off() 
  
  png(paste0("/Users/mitchellellison/Desktop/PaperAnalysis2/Analysis.Annotated.Region/pafvswt_plots/", "Boxplot.paf1vswt", j, ".png"), height = 400, width = 400)
  boxplot(k$WT.mean, k$paf1D.mean)
  dev.off()
}


for(i in 1:length(levels(data.file$feature))){
  
  j = levels(data.file$feature)[i]
  print(j)
  
  k = data.file[data.file$feature == j,]
  
  png(paste0("/Users/mitchellellison/Desktop/PaperAnalysis2/Analysis.Annotated.Region/paftrfvstrf_plots/", "Biplot.paftrfvstrf", j, ".png"), height = 400, width = 400)
  plot(k$trf4D.mean, k$pafDtrf4D.mean, cex = 0.8, pch = 16, ylim = c(6,16), xlim = c(6,16), col=rgb(0,0,0,0.3))
  abline(a = 0, b = 1, lwd = 2)
  dev.off() 
  
  png(paste0("/Users/mitchellellison/Desktop/PaperAnalysis2/Analysis.Annotated.Region/paftrfvstrf_plots/", "Boxplot.paftrfvstrf", j, ".png"), height = 400, width = 400)
  boxplot(k$trf4D.mean, k$pafDtrf4D.mean)
  dev.off()
}



j = levels(data.file$feature)[11]
print(j)

k = data.file[data.file$feature == j,]

png(paste0("/Users/mitchellellison/Desktop/PaperAnalysis2/Analysis.Annotated.Region/paftrfvstrf_plots/",  j, "_FOR_FIGURE_", "Biplot.paftrfvstrf", ".png"), height = 400, width = 400)
plot(k$trf4D.mean, k$pafDtrf4D.mean, cex = 1, pch = 16, ylim = c(7,11), xlim = c(7,11), col=rgb(0,0,0,0.5))
abline(a = 0, b = 1, lwd = 2)
dev.off() 



