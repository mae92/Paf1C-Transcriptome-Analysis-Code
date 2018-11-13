#Identifying Differentially expressed regions with a 1.5-fold cuttoff
awk -v OFS="\t" '$4 >= 0.58 {print $1,$2,$3,".",$4,$5}' paf1.vs.wt.minus.window.20.bedgraph | sortBed -i stdin | mergeBed -s -d 25 -c 5 -o mean -i stdin | awk -v OFS="\t" '{print $1,$2,$3,$4,$5,$3-$2}' | awk -v OFS="\t" '$6 > 80 {print $1,$2,$3,$4,$5,$6}' | awk -v OFS="\t" '{print $1,$2,$3,$6,$5,$4}' > paf1.vs.wt.minus.window.20.1.5fold.increased.bed
awk -v OFS="\t" '$4 <= -0.58 {print $1,$2,$3,".",$4,$5}' paf1.vs.wt.minus.window.20.bedgraph | sortBed -i stdin | mergeBed -s -d 25 -c 5 -o mean -i stdin | awk -v OFS="\t" '{print $1,$2,$3,$4,$5,$3-$2}' | awk -v OFS="\t" '$6 > 80 {print $1,$2,$3,$4,$5,$6}' | awk -v OFS="\t" '{print $1,$2,$3,$6,$5,$4}' > paf1.vs.wt.minus.window.20.1.5fold.decreased.bed
cat paf1.vs.wt.minus.window.20.1.5fold.increased.bed paf1.vs.wt.minus.window.20.1.5fold.decreased.bed | sortBed -i stdin > paf1.vs.wt.minus.window.20.1.5fold.denovo.annotation.bed

awk -v OFS="\t" '$4 >= 0.58 {print $1,$2,$3,".",$4,$5}' paf1.vs.wt.plus.window.20.bedgraph | sortBed -i stdin | mergeBed -s -d 25 -c 5 -o mean -i stdin | awk -v OFS="\t" '{print $1,$2,$3,$4,$5,$3-$2}' | awk -v OFS="\t" '$6 > 80 {print $1,$2,$3,$4,$5,$6}' | awk -v OFS="\t" '{print $1,$2,$3,$6,$5,$4}' > paf1.vs.wt.plus.window.20.1.5fold.increased.bed
awk -v OFS="\t" '$4 <= -0.58 {print $1,$2,$3,".",$4,$5}' paf1.vs.wt.plus.window.20.bedgraph | sortBed -i stdin | mergeBed -s -d 25 -c 5 -o mean -i stdin | awk -v OFS="\t" '{print $1,$2,$3,$4,$5,$3-$2}' | awk -v OFS="\t" '$6 > 80 {print $1,$2,$3,$4,$5,$6}' | awk -v OFS="\t" '{print $1,$2,$3,$6,$5,$4}' > paf1.vs.wt.plus.window.20.1.5fold.decreased.bed
cat paf1.vs.wt.plus.window.20.1.5fold.increased.bed paf1.vs.wt.plus.window.20.1.5fold.decreased.bed | sortBed -i stdin > paf1.vs.wt.plus.window.20.1.5fold.denovo.annotation.bed

awk -v OFS="\t" '$4 >= 0.58 {print $1,$2,$3,".",$4,$5}' paf1trf4.vs.trf4.minus.window.20.bedgraph | sortBed -i stdin | mergeBed -s -d 25 -c 5 -o mean -i stdin | awk -v OFS="\t" '{print $1,$2,$3,$4,$5,$3-$2}' | awk -v OFS="\t" '$6 > 80 {print $1,$2,$3,$4,$5,$6}' | awk -v OFS="\t" '{print $1,$2,$3,$6,$5,$4}' > paf1trf4.vs.trf4.minus.window.20.1.5fold.increased.bed
awk -v OFS="\t" '$4 <= -0.58 {print $1,$2,$3,".",$4,$5}' paf1trf4.vs.trf4.minus.window.20.bedgraph | sortBed -i stdin | mergeBed -s -d 25 -c 5 -o mean -i stdin | awk -v OFS="\t" '{print $1,$2,$3,$4,$5,$3-$2}' | awk -v OFS="\t" '$6 > 80 {print $1,$2,$3,$4,$5,$6}' | awk -v OFS="\t" '{print $1,$2,$3,$6,$5,$4}' > paf1trf4.vs.trf4.minus.window.20.1.5fold.decreased.bed
cat paf1trf4.vs.trf4.minus.window.20.1.5fold.increased.bed paf1trf4.vs.trf4.minus.window.20.1.5fold.decreased.bed | sortBed -i stdin > paf1trf4.vs.trf4.minus.window.20.1.5fold.denovo.annotation.bed

awk -v OFS="\t" '$4 >= 0.58 {print $1,$2,$3,".",$4,$5}' paf1trf4.vs.trf4.plus.window.20.bedgraph | sortBed -i stdin | mergeBed -s -d 25 -c 5 -o mean -i stdin | awk -v OFS="\t" '{print $1,$2,$3,$4,$5,$3-$2}' | awk -v OFS="\t" '$6 > 80 {print $1,$2,$3,$4,$5,$6}' | awk -v OFS="\t" '{print $1,$2,$3,$6,$5,$4}' > paf1trf4.vs.trf4.plus.window.20.1.5fold.increased.bed
awk -v OFS="\t" '$4 <= -0.58 {print $1,$2,$3,".",$4,$5}' paf1trf4.vs.trf4.plus.window.20.bedgraph | sortBed -i stdin | mergeBed -s -d 25 -c 5 -o mean -i stdin | awk -v OFS="\t" '{print $1,$2,$3,$4,$5,$3-$2}' | awk -v OFS="\t" '$6 > 80 {print $1,$2,$3,$4,$5,$6}' | awk -v OFS="\t" '{print $1,$2,$3,$6,$5,$4}' > paf1trf4.vs.trf4.plus.window.20.1.5fold.decreased.bed
cat paf1trf4.vs.trf4.plus.window.20.1.5fold.increased.bed paf1trf4.vs.trf4.plus.window.20.1.5fold.decreased.bed | sortBed -i stdin > paf1trf4.vs.trf4.plus.window.20.1.5fold.denovo.annotation.bed


#Extending those regions out to the ends of the differentially expressed region
cat paf1.vs.wt.minus.window.20.1.5fold.denovo.annotation.bed paf1.vs.wt.plus.window.20.1.5fold.denovo.annotation.bed > paf1.vs.wt.window.20.1.5fold.annotations.bed
cat paf1trf4.vs.trf4.minus.window.20.1.5fold.denovo.annotation.bed paf1trf4.vs.trf4.plus.window.20.1.5fold.denovo.annotation.bed > paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed

awk -v OFS="\t" '$5 >= 0 {print}' paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed > repressed.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed
awk -v OFS="\t" '$5 <= 0 {print}' paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed > induced.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed
awk -v OFS="\t" '$5 >= 0 {print}' paf1.vs.wt.window.20.1.5fold.annotations.bed > repressed.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed
awk -v OFS="\t" '$5 <= 0 {print}' paf1.vs.wt.window.20.1.5fold.annotations.bed > induced.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed
