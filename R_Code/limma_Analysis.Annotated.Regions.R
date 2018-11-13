setwd("/Users/mitchellellison/Desktop/PaperAnalysis2/Mapped.Annotated.Region")


chr1.minus=read.csv("1.-.mapped.csv")
chr2.minus=read.csv("2.-.mapped.csv")
chr3.minus=read.csv("3.-.mapped.csv")
chr4.minus=read.csv("4.-.mapped.csv")
chr5.minus=read.csv("5.-.mapped.csv")
chr6.minus=read.csv("6.-.mapped.csv")
chr7.minus=read.csv("7.-.mapped.csv")
chr8.minus=read.csv("8.-.mapped.csv")
chr9.minus=read.csv("9.-.mapped.csv")
chr10.minus=read.csv("10.-.mapped.csv")
chr11.minus=read.csv("11.-.mapped.csv")
chr12.minus=read.csv("12.-.mapped.csv")
chr13.minus=read.csv("13.-.mapped.csv")
chr14.minus=read.csv("14.-.mapped.csv")
chr15.minus=read.csv("15.-.mapped.csv")
chr16.minus=read.csv("16.-.mapped.csv")
chrmt.minus=read.csv("mt.-.mapped.csv")


chr1.plus=read.csv("1.+.mapped.csv")
chr2.plus=read.csv("2.+.mapped.csv")
chr3.plus=read.csv("3.+.mapped.csv")
chr4.plus=read.csv("4.+.mapped.csv")
chr5.plus=read.csv("5.+.mapped.csv")
chr6.plus=read.csv("6.+.mapped.csv")
chr7.plus=read.csv("7.+.mapped.csv")
chr8.plus=read.csv("8.+.mapped.csv")
chr9.plus=read.csv("9.+.mapped.csv")
chr10.plus=read.csv("10.+.mapped.csv")
chr11.plus=read.csv("11.+.mapped.csv")
chr12.plus=read.csv("12.+.mapped.csv")
chr13.plus=read.csv("13.+.mapped.csv")
chr14.plus=read.csv("14.+.mapped.csv")
chr15.plus=read.csv("15.+.mapped.csv")
chr16.plus=read.csv("16.+.mapped.csv")
chrmt.plus=read.csv("mt.+.mapped.csv")


setwd("/Users/mitchellellison/Desktop/PaperAnalysis2/Analysis.Annotated.Region")


#sum(dim(chr1.minus), dim(chr2.minus), dim(chr3.minus), dim(chr4.minus), dim(chr5.minus), dim(chr6.minus), dim(chr7.minus), dim(chr8.minus), dim(chr9.minus), dim(chr10.minus), dim(chr11.minus), dim(chr12.minus), dim(chr13.minus), dim(chr14.minus), dim(chr15.minus), dim(chr16.minus), dim(chrmt.minus))

#minus.sum=sum(dim(chr1.minus), dim(chr2.minus), dim(chr3.minus), dim(chr4.minus), dim(chr5.minus), dim(chr6.minus), dim(chr7.minus), dim(chr8.minus), dim(chr9.minus), dim(chr10.minus), dim(chr11.minus), dim(chr12.minus), dim(chr13.minus), dim(chr14.minus), dim(chr15.minus), dim(chr16.minus), dim(chrmt.minus))-(22*17)

#sum(dim(chr1.plus), dim(chr2.plus), dim(chr3.plus), dim(chr4.plus), dim(chr5.plus), dim(chr6.plus), dim(chr7.plus), dim(chr8.plus), dim(chr9.plus), dim(chr10.plus), dim(chr11.plus), dim(chr12.plus), dim(chr13.plus), dim(chr14.plus), dim(chr15.plus), dim(chr16.plus), dim(chrmt.plus))

#plus.sum=sum(dim(chr1.plus), dim(chr2.plus), dim(chr3.plus), dim(chr4.plus), dim(chr5.plus), dim(chr6.plus), dim(chr7.plus), dim(chr8.plus), dim(chr9.plus), dim(chr10.plus), dim(chr11.plus), dim(chr12.plus), dim(chr13.plus), dim(chr14.plus), dim(chr15.plus), dim(chr16.plus), dim(chrmt.plus))-(22*17)

#sum(minus.sum, plus.sum)

#check=rbind(chr1.plus, chr2.plus, chr3.plus, chr4.plus, chr5.plus, chr6.plus, chr7.plus, chr8.plus, chr9.plus, chr10.plus, chr11.plus, chr12.plus, chr13.plus, chr14.plus, chr15.plus, chr16.plus, chrmt.plus, chr1.minus, chr2.minus, chr3.minus, chr4.minus, chr5.minus, chr6.minus, chr7.minus, chr8.minus, chr9.minus, chr10.minus, chr11.minus, chr12.minus, chr13.minus, chr14.minus, chr15.minus, chr16.minus, chrmt.minus)

####I dont know why these are still so different but I am moving on and will assess again with the subsetted list##

All.minus=rbind(chr1.minus,chr2.minus,chr3.minus,chr4.minus,chr5.minus,chr6.minus,chr7.minus,chr8.minus,chr9.minus,chr10.minus,chr11.minus,chr12.minus,chr13.minus,chr14.minus,chr15.minus,chr16.minus,chrmt.minus)
dim(All.minus)

All.plus=rbind(chr1.plus,chr2.plus,chr3.plus,chr4.plus,chr5.plus,chr6.plus,chr7.plus,chr8.plus,chr9.plus,chr10.plus,chr11.plus,chr12.plus,chr13.plus,chr14.plus,chr15.plus,chr16.plus,chrmt.plus)
dim(All.plus)

All=rbind(All.plus, All.minus)
dim(All)

write.table(All, "All.RNA.before.limma.csv", sep = ",", col.names = TRUE, row.names = TRUE, quote = FALSE)

head(All)
dim(All)

All.fix = All[13:24]

head(All.fix)

rownames(All.fix) = paste0(All$identifier, ";", All$feature)

head(All.fix)


all.average.and.stdev = cbind(apply(All.fix[,1:3], 1, mean), apply(All.fix[,1:3], 1, sd), apply(All.fix[,4:6], 1, mean), apply(All.fix[,4:6], 1, sd), apply(All.fix[,7:9], 1, mean), apply(All.fix[,7:9], 1, sd), apply(All.fix[,10:12], 1, mean), apply(All.fix[,10:12], 1, sd))
colnames(all.average.and.stdev) = c("paf1D.mean", "paf1D.sd", "pafDtrf4D.mean", "pafDtrf4D.sd", "trf4D.mean", "trf4D.sd", "WT.mean", "WT.sd")
head(all.average.and.stdev)
all.average.and.stdev = as.data.frame(all.average.and.stdev)
head(all.average.and.stdev)

write.table(all.average.and.stdev, "All.RNA.biplotting.table.before.limma.csv", sep = ",", col.names = TRUE, row.names = TRUE, quote = FALSE)


All.paf.vs.wt = All.fix[c(1:3,10:12)]

head(All.paf.vs.wt)

write.table(All.paf.vs.wt, "All.paf.vs.wt.csv", sep = ",", row.names = TRUE, col.names = TRUE, quote = FALSE)

##Limma analysis##
library(davidTiling)
library(limma)

design <- model.matrix(~ 0+factor(c(1,1,1,2,2,2)))

colnames(design) <- c("paf1", "wt")

fit <- lmFit(All.paf.vs.wt, design)

contrast.matrix <- makeContrasts(paf1-wt, levels=design)

fit2 <- contrasts.fit(fit, contrast.matrix)

fit3 <- eBayes(fit2, proportion=0)

top = topTable(fit3, coef=NULL, number = 100000, adjust="fdr")

dim(top)

write.table(top, "pafVSwt.all.csv", sep = ",", row.names = TRUE, col.names = TRUE, quote = FALSE)

save(fit3, file="pafVSwt.fit3.rda")


significant.fc.1.5 = topTable(fit3, coef=NULL, number = 100000, adjust="fdr", lfc = 0.58, p.value = 0.05)

write.table(significant.fc.1.5, "pafVSwt.significant.fc.1.5.csv", sep = ",", row.names = TRUE, col.names = TRUE, quote = FALSE)


up = significant.fc.1.5[significant.fc.1.5$logFC > 0,]
write.table(up, "limma.increased.paf1vswt.csv", sep = ",", row.names = TRUE, col.names = TRUE, quote = FALSE)
write.table(rownames(up), "limma.increased.paf1vswt.for.Grep.txt", row.names = FALSE, col.names = FALSE, quote = FALSE)


down = significant.fc.1.5[significant.fc.1.5$logFC < 0,]
write.table(significant.fc.1.5, "limma.decreased.paf1vswt.csv", sep = ",", row.names = TRUE, col.names = TRUE, quote = FALSE)
write.table(rownames(down), "limma.decreased.paf1vswt.for.Grep.txt", row.names = FALSE, col.names = FALSE, quote = FALSE)



top = topTable(fit3, coef=NULL, number = 100000, adjust="fdr")

dim(top)

write.table(top, "pafVSwt.all.csv", sep = ",", row.names = TRUE, col.names = TRUE, quote = FALSE)

png("paf.vs.wt.volcano.png", height = 400, width = 400)
plot(top$logFC, -log10(top$adj.P.Val), cex = 0.8, pch = 16, ylim = c(0,5), xlim = c(-4,4))
points(top[top$logFC > 0.58,]$logFC, -log10(top[top$logFC > 0.58,]$adj.P.Val), cex = 0.8, pch = 16, col = "orange")
points(top[top$logFC < -0.58,]$logFC, -log10(top[top$logFC < -0.58,]$adj.P.Val), cex = 0.8, pch = 16, col = "purple")
points(top[top$adj.P.Val > 0.05,]$logFC, -log10(top[top$adj.P.Val > 0.05,]$adj.P.Val), cex = 0.8, pch = 16, col = "gray")
dev.off()


##################################


All.paftrf.vs.trf = All.fix[4:9]

head(All.paftrf.vs.trf)

write.table(All.paftrf.vs.trf, "All.paftrf.vs.trf.csv", sep = ",", row.names = TRUE, col.names = TRUE, quote = FALSE)

##Limma analysis 2##

design <- model.matrix(~ 0+factor(c(1,1,1,2,2,2)))

colnames(design) <- c("trf4paf1", "trf4")

fit <- lmFit(All.paftrf.vs.trf, design)

contrast.matrix <- makeContrasts(trf4paf1-trf4, levels=design)

fit2 <- contrasts.fit(fit, contrast.matrix)

fit3 <- eBayes(fit2, proportion=0)



significant.fc.1.5 = topTable(fit3, coef=NULL, number = 100000, adjust="fdr", lfc = 0.58, p.value = 0.05)

write.table(significant.fc.1.5, "paftrfVStrf.significant.fc.1.5.csv", sep = ",", row.names = TRUE, col.names = TRUE, quote = FALSE)



up = significant.fc.1.5[significant.fc.1.5$logFC > 0,]
write.table(up, "limma.increased.paf1trf4vstrf4.csv", sep = ",", row.names = TRUE, col.names = TRUE, quote = FALSE)
write.table(rownames(up), "limma.increased.paf1trf4vstrf4.for.Grep.txt", row.names = FALSE, col.names = FALSE, quote = FALSE)



down = significant.fc.1.5[significant.fc.1.5$logFC < 0,]
write.table(significant.fc.1.5, "limma.decreased.paf1trf4vstrf4.csv", sep = ",", row.names = TRUE, col.names = TRUE, quote = FALSE)
write.table(rownames(down), "limma.decreased.paf1trf4vstrf4.for.Grep.txt", row.names = FALSE, col.names = FALSE, quote = FALSE)




top = topTable(fit3, coef=NULL, number = 100000, adjust="fdr")

dim(top)

write.table(top, "paftrfVStrf.all.csv", sep = ",", row.names = TRUE, col.names = TRUE, quote = FALSE)

save(fit3, file="paftrfVStrf.fit3.rda")


png("paftrf.vs.trf.volcano.png", height = 400, width = 400)
plot(top$logFC, -log10(top$adj.P.Val), cex = 0.8, pch = 16, ylim = c(0,5), xlim = c(-4,4))
points(top[top$logFC > 0.58,]$logFC, -log10(top[top$logFC > 0.58,]$adj.P.Val), cex = 0.8, pch = 16, col = "orange")
points(top[top$logFC < -0.58,]$logFC, -log10(top[top$logFC < -0.58,]$adj.P.Val), cex = 0.8, pch = 16, col = "purple")
points(top[top$adj.P.Val > 0.05,]$logFC, -log10(top[top$adj.P.Val > 0.05,]$adj.P.Val), cex = 0.8, pch = 16, col = "gray")
dev.off()

