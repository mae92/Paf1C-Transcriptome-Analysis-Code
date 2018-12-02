cd /Users/mitchellellison/Desktop/PaperAnalyses
ls


awk '$4 >= 0.58 {print $1 "\t" $2 "\t" $3 "\t" "." "\t" $4 "\t" $5}' paf1.vs.wt.minus.window.20.bedgraph | sortBed -i stdin | mergeBed -s -d 25 -c 5 -o mean -i stdin | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $3-$2}' | awk '$6 > 80 {print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6}' | awk '{print $1 "\t" $2 "\t" $3 "\t" $6 "\t" $5 "\t" $4}' > paf1.vs.wt.minus.1.5fold.increased.bed


awk '$4 <= -0.58 {print $1 "\t" $2 "\t" $3 "\t" "." "\t" $4 "\t" $5}' paf1.vs.wt.minus.window.20.bedgraph | sortBed -i stdin | mergeBed -s -d 25 -c 5 -o mean -i stdin | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $3-$2}' | awk '$6 > 80 {print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6}' | awk '{print $1 "\t" $2 "\t" $3 "\t" $6 "\t" $5 "\t" $4}' > paf1.vs.wt.minus.1.5fold.decreased.bed


cat paf1.vs.wt.minus.1.5fold.increased.bed paf1.vs.wt.minus.1.5fold.decreased.bed | sortBed -i stdin > paf1.vs.wt.minus.1.5fold.denovo.annotation.bed

#rm paf1.vs.wt.minus.1.5fold.increased.bed paf1.vs.wt.minus.1.5fold.decreased.bed


########################################################################

awk '$4 >= 0.58 {print $1 "\t" $2 "\t" $3 "\t" "." "\t" $4 "\t" $5}' paf1.vs.wt.plus.window.20.bedgraph | sortBed -i stdin | mergeBed -s -d 25 -c 5 -o mean -i stdin | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $3-$2}' | awk '$6 > 80 {print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6}' | awk '{print $1 "\t" $2 "\t" $3 "\t" $6 "\t" $5 "\t" $4}' > paf1.vs.wt.plus.1.5fold.increased.bed


awk '$4 <= -0.58 {print $1 "\t" $2 "\t" $3 "\t" "." "\t" $4 "\t" $5}' paf1.vs.wt.plus.window.20.bedgraph | sortBed -i stdin | mergeBed -s -d 25 -c 5 -o mean -i stdin | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $3-$2}' | awk '$6 > 80 {print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6}' | awk '{print $1 "\t" $2 "\t" $3 "\t" $6 "\t" $5 "\t" $4}' > paf1.vs.wt.plus.1.5fold.decreased.bed


cat paf1.vs.wt.plus.1.5fold.increased.bed paf1.vs.wt.plus.1.5fold.decreased.bed | sortBed -i stdin > paf1.vs.wt.plus.1.5fold.denovo.annotation.bed

#rm paf1.vs.wt.plus.1.5fold.increased.bed paf1.vs.wt.plus.1.5fold.decreased.bed


########################################################################
########################################################################


awk -v OFS="\t" '$4 >= 0.58 {print $1,$2,$3,".",$4,$5}' paf1trf4.vs.trf4.minus.window.20.bedgraph | sortBed -i stdin | mergeBed -s -d 25 -c 5 -o mean -i stdin | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $3-$2}' | awk '$6 > 80 {print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6}' | awk '{print $1 "\t" $2 "\t" $3 "\t" $6 "\t" $5 "\t" $4}' > paf1trf4.vs.trf4.minus.1.5fold.increased.bed


awk -v OFS="\t" '$4 <= -0.58 {print $1,$2,$3,".",$4,$5}' paf1trf4.vs.trf4.minus.window.20.bedgraph | sortBed -i stdin | mergeBed -s -d 25 -c 5 -o mean -i stdin | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $3-$2}' | awk '$6 > 80 {print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6}' | awk '{print $1 "\t" $2 "\t" $3 "\t" $6 "\t" $5 "\t" $4}' > paf1trf4.vs.trf4.minus.1.5fold.decreased.bed


cat paf1trf4.vs.trf4.minus.1.5fold.increased.bed paf1trf4.vs.trf4.minus.1.5fold.decreased.bed | sortBed -i stdin > paf1trf4.vs.trf4.minus.1.5fold.denovo.annotation.bed

#rm paf1trf4.vs.trf4.minus.1.5fold.increased.bed paf1trf4.vs.trf4.minus.1.5fold.decreased.bed

########################################################################

awk -v OFS="\t" '$4 >= 0.58 {print $1,$2,$3,".",$4,$5}' paf1trf4.vs.trf4.plus.window.20.bedgraph | sortBed -i stdin | mergeBed -s -d 25 -c 5 -o mean -i stdin | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $3-$2}' | awk '$6 > 80 {print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6}' | awk '{print $1 "\t" $2 "\t" $3 "\t" $6 "\t" $5 "\t" $4}' > paf1trf4.vs.trf4.plus.1.5fold.increased.bed


awk -v OFS="\t" '$4 <= -0.58 {print $1,$2,$3,".",$4,$5}' paf1trf4.vs.trf4.plus.window.20.bedgraph | sortBed -i stdin | mergeBed -s -d 25 -c 5 -o mean -i stdin | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $3-$2}' | awk '$6 > 80 {print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6}' | awk '{print $1 "\t" $2 "\t" $3 "\t" $6 "\t" $5 "\t" $4}' > paf1trf4.vs.trf4.plus.1.5fold.decreased.bed


cat paf1trf4.vs.trf4.plus.1.5fold.increased.bed paf1trf4.vs.trf4.plus.1.5fold.decreased.bed | sortBed -i stdin > paf1trf4.vs.trf4.plus.1.5fold.denovo.annotation.bed

#rm paf1trf4.vs.trf4.plus.1.5fold.increased.bed paf1trf4.vs.trf4.plus.1.5fold.decreased.bed

