cd /Users/mitchellellison/Desktop/PaperAnalyses
ls

intersectBed -a paf1.vs.wt.minus.1fold.denovo.annotation.bed -b paf1.vs.wt.minus.1.5fold.denovo.annotation.bed -wa -s | awk '!seen[$0]++' > paf1.vs.wt.minus.denovo.annotation.bed

intersectBed -a paf1.vs.wt.plus.1fold.denovo.annotation.bed -b paf1.vs.wt.plus.1.5fold.denovo.annotation.bed -wa -s | awk '!seen[$0]++' > paf1.vs.wt.plus.denovo.annotation.bed

cat paf1.vs.wt.minus.denovo.annotation.bed paf1.vs.wt.plus.denovo.annotation.bed > paf1.vs.wt.denovo.annotation.bed


intersectBed -a paf1trf4.vs.trf4.minus.1fold.denovo.annotation.bed -b paf1trf4.vs.trf4.minus.1.5fold.denovo.annotation.bed -wa -s | awk '!seen[$0]++' > paf1trf4.vs.trf4.minus.denovo.annotation.bed

intersectBed -a paf1trf4.vs.trf4.plus.1fold.denovo.annotation.bed -b paf1trf4.vs.trf4.plus.1.5fold.denovo.annotation.bed -wa -s | awk '!seen[$0]++' > paf1trf4.vs.trf4.plus.denovo.annotation.bed

cat paf1trf4.vs.trf4.minus.denovo.annotation.bed paf1trf4.vs.trf4.plus.denovo.annotation.bed > paf1.vs.wt.denovo.annotation.bed


intersectBed -a paf1.vs.wt.minus.1fold.decreased.bed -b paf1.vs.wt.minus.1.5fold.decreased.bed -wa -s | awk '!seen[$0]++' > paf1.vs.wt.minus.decreased.bed

intersectBed -a paf1.vs.wt.minus.1fold.increased.bed -b paf1.vs.wt.minus.1.5fold.increased.bed -wa -s | awk '!seen[$0]++' > paf1.vs.wt.minus.increased.bed

intersectBed -a paf1.vs.wt.plus.1fold.decreased.bed -b paf1.vs.wt.plus.1.5fold.decreased.bed -wa -s | awk '!seen[$0]++' > paf1.vs.wt.plus.decreased.bed

intersectBed -a paf1.vs.wt.plus.1fold.increased.bed -b paf1.vs.wt.plus.1.5fold.increased.bed -wa -s | awk '!seen[$0]++' > paf1.vs.wt.plus.increased.bed



intersectBed -a paf1trf4.vs.trf4.minus.1fold.decreased.bed -b paf1trf4.vs.trf4.minus.1.5fold.decreased.bed -wa -s | awk '!seen[$0]++' > paf1trf4.vs.trf4.minus.decreased.bed

intersectBed -a paf1trf4.vs.trf4.minus.1fold.increased.bed -b paf1trf4.vs.trf4.minus.1.5fold.increased.bed -wa -s | awk '!seen[$0]++' > paf1trf4.vs.trf4.minus.increased.bed

intersectBed -a paf1trf4.vs.trf4.plus.1fold.decreased.bed -b paf1trf4.vs.trf4.plus.1.5fold.decreased.bed -wa -s | awk '!seen[$0]++' > paf1trf4.vs.trf4.plus.decreased.bed

intersectBed -a paf1trf4.vs.trf4.plus.1fold.increased.bed -b paf1trf4.vs.trf4.plus.1.5fold.increased.bed -wa -s | awk '!seen[$0]++' > paf1trf4.vs.trf4.plus.increased.bed


