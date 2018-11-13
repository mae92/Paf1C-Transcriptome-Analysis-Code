setwd("/Users/mitchellellison/Desktop/Backup_Desktop/log2-diff-denovo-analysis")
dir()

wt.p = read.delim("Wild.Plus.Strand.bedgraph", header = FALSE)
wt.m = read.delim("Wild.Minus.Strand.bedgraph", header = FALSE)
paf1.p = read.delim("Paf1.Plus.Strand.bedgraph", header = FALSE)
paf1.m = read.delim("Paf1.Minus.Strand.bedgraph", header = FALSE)
trf4.p = read.delim("Trf4.Plus.Strand.bedgraph", header = FALSE)
trf4.m = read.delim("Trf4.Minus.Strand.bedgraph", header = FALSE)
trf4paf1.p = read.delim("Trf4Paf1.Plus.Strand.bedgraph", header = FALSE)
trf4paf1.m = read.delim("Trf4Paf1.Minus.Strand.bedgraph", header = FALSE)

paf1.vs.wt.p = cbind(wt.p[1:3], (paf1.p[4]-wt.p[4]), "+")
colnames(paf1.vs.wt.p) = c("V1", "V2", "V3", "V4", "V5")
write.table(paf1.vs.wt.p, "paf1.vs.wt.plus.bedgraph", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")

paf1.vs.wt.p.cutoff = rbind(paf1.vs.wt.p[paf1.vs.wt.p$V4 >= 1,], paf1.vs.wt.p[paf1.vs.wt.p$V4 <= -1,])
write.table(paf1.vs.wt.p.cutoff, "paf1.vs.wt.plus.cutoff.bedgraph", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")


paf1.vs.wt.m = cbind(wt.m[1:3], (paf1.m[4]-wt.m[4]), "-")
colnames(paf1.vs.wt.m) = c("V1", "V2", "V3", "V4", "V5")
write.table(paf1.vs.wt.m, "paf1.vs.wt.minus.bedgraph", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")

paf1.vs.wt.m.cutoff = rbind(paf1.vs.wt.m[paf1.vs.wt.m$V4 >= 1,], paf1.vs.wt.m[paf1.vs.wt.m$V4 <= -1,])
write.table(paf1.vs.wt.m.cutoff, "paf1.vs.wt.minus.cutoff.bedgraph", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")


paf1trf4.vs.trf4.p = cbind(trf4.p[1:3], (trf4paf1.p[4]-trf4.p[4]), "+")
colnames(paf1trf4.vs.trf4.p) = c("V1", "V2", "V3", "V4", "V5")
write.table(paf1trf4.vs.trf4.p, "paf1trf4.vs.trf4.plus.bedgraph", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")

paf1trf4.vs.trf4.p.cutoff = rbind(paf1trf4.vs.trf4.p[paf1trf4.vs.trf4.p$V4 >= 1,], paf1trf4.vs.trf4.p[paf1trf4.vs.trf4.p$V4 <= -1,])
write.table(paf1trf4.vs.trf4.p.cutoff, "paf1trf4.vs.trf4.plus.cutoff.bedgraph", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")


paf1trf4.vs.trf4.m = cbind(trf4.m[1:3], (trf4paf1.m[4]-trf4.m[4]), "-")
colnames(paf1trf4.vs.trf4.m) = c("V1", "V2", "V3", "V4", "V5")
write.table(paf1trf4.vs.trf4.m, "paf1trf4.vs.trf4.minus.bedgraph", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")

paf1trf4.vs.trf4.m.cutoff = rbind(paf1trf4.vs.trf4.m[paf1trf4.vs.trf4.m$V4 >= 1,], paf1trf4.vs.trf4.m[paf1trf4.vs.trf4.m$V4 <= -1,])
write.table(paf1trf4.vs.trf4.m.cutoff, "paf1trf4.vs.trf4.minus.cutoff.bedgraph", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")


paf1.vs.wt = rbind(paf1.vs.wt.p, paf1.vs.wt.m)
dim(paf1.vs.wt)
write.table(paf1.vs.wt, "paf1.vs.wt.bedgraph", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")

paf1trf4.vs.trf4 = rbind(paf1trf4.vs.trf4.p, paf1trf4.vs.trf4.m)
dim(paf1trf4.vs.trf4)
write.table(paf1trf4.vs.trf4, "paf1trf4.vs.trf4.bedgraph", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")

#rm(wt.m, wt.p, paf1.m, paf1.p, trf4.m, trf4.p, trf4paf1.m, trf4paf1.p, paf1.vs.wt.m, paf1.vs.wt.p, paf1trf4.vs.trf4.m, paf1trf4.vs.trf4.p)

paf1.vs.wt.cutoff = rbind(paf1.vs.wt[paf1.vs.wt$V4 >= 1,], paf1.vs.wt[paf1.vs.wt$V4 <= -1,])
dim(paf1.vs.wt.cutoff)
write.table(paf1.vs.wt.cutoff, "paf1.vs.wt.cutoff.bedgraph", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")

paf1trf4.vs.trf4.cutoff = rbind(paf1trf4.vs.trf4[paf1trf4.vs.trf4$V4 >= 1,], paf1trf4.vs.trf4[paf1trf4.vs.trf4$V4 <= -1,])
dim(paf1trf4.vs.trf4.cutoff)
write.table(paf1trf4.vs.trf4.cutoff, "paf1trf4.vs.trf4.cutoff.bedgraph", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")

