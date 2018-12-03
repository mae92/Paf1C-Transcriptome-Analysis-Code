cd /Volumes/Mitch/PaperAnalyses1/A_Position_Relative_to_mRNA 
ls

bedtools intersect -a induced.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed -b mRNA.sorted.bed  -s -wa > induced.regions.paf1.vs.wt.1.5.mRNA.same.strand.overlapping.bed
ls

bedtools intersect -a induced.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed -b mRNA.sorted.bed  -S -wa > induced.regions.paf1.vs.wt.1.5.mRNA.opposite.strand.overlapping.bed
ls

bedtools intersect -a induced.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed -b mRNA.sorted.bed -v > induced.regions.paf1.vs.wt.1.5.mRNA.non.overlapping.bed
ls

bedtools window -a induced.regions.paf1.vs.wt.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -l 200 -r 0 -sm > induced.regions.paf1.vs.wt.1.5.mRNA.upstream.tandem.bed
ls

bedtools window -a induced.regions.paf1.vs.wt.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -l 0 -r 200 -sm > induced.regions.paf1.vs.wt.1.5.mRNA.downstream.tandem.bed
ls

bedtools window -a induced.regions.paf1.vs.wt.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -l 200 -r 0 -Sm > induced.regions.paf1.vs.wt.1.5.mRNA.divergent.bed
ls

bedtools window -a induced.regions.paf1.vs.wt.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -l 0 -r 200 -Sm > induced.regions.paf1.vs.wt.1.5.mRNA.convergent.bed
ls

bedtools window -a induced.regions.paf1.vs.wt.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -l 200 -r 200 -v > induced.regions.paf1.vs.wt.1.5.mRNA.intergenic.bed
ls

bedtools intersect -a induced.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed -b induced.regions.paf1.vs.wt.1.5.mRNA.same.strand.overlapping.bed -s -c | bedtools intersect -a stdin -b induced.regions.paf1.vs.wt.1.5.mRNA.opposite.strand.overlapping.bed -s -c | bedtools window -a stdin -b induced.regions.paf1.vs.wt.1.5.mRNA.non.overlapping.bed -w 200  -sm -c | bedtools window -a stdin -b induced.regions.paf1.vs.wt.1.5.mRNA.upstream.tandem.bed -w 200  -sm -c | bedtools window -a stdin -b induced.regions.paf1.vs.wt.1.5.mRNA.downstream.tandem.bed -w 200  -sm -c | bedtools window -a stdin -b induced.regions.paf1.vs.wt.1.5.mRNA.divergent.bed -w 200  -sm -c | bedtools window -a stdin -b induced.regions.paf1.vs.wt.1.5.mRNA.convergent.bed -w 200  -sm -c | bedtools window -a stdin -b induced.regions.paf1.vs.wt.1.5.mRNA.intergenic.bed -w 200 -sm -c > induced.regions.paf1.vs.wt.1.5.master.count.table.txt

##Columns for count table: chr, start, end, length, log2_fc, strand, ss_overlap_+-_200bp, as_overlap_+-_200bp, no_overlap_+-_200, ss_upstream_+-_200, ss_downstream, as_divergent, as_convergent, intergenic, 











bedtools intersect -a induced.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed -b mRNA.sorted.bed -s -wa > induced.regions.paf1trf4.vs.trf4.1.5.mRNA.same.strand.overlapping.bed
ls

bedtools intersect -a induced.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed -b mRNA.sorted.bed -S -wa > induced.regions.paf1trf4.vs.trf4.1.5.mRNA.opposite.strand.overlapping.bed
ls

bedtools intersect -a induced.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed -b mRNA.sorted.bed -v > induced.regions.paf1trf4.vs.trf4.1.5.mRNA.non.overlapping.bed
ls

bedtools window -a induced.regions.paf1trf4.vs.trf4.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -sm -l 200 -r 0   > induced.regions.paf1trf4.vs.trf4.1.5.mRNA.upstream.tandem.bed
ls

bedtools window -a induced.regions.paf1trf4.vs.trf4.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -sm -l 0 -r 200   > induced.regions.paf1trf4.vs.trf4.1.5.mRNA.downstream.tandem.bed
ls

bedtools window -a induced.regions.paf1trf4.vs.trf4.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -Sm -l 200 -r 0   > induced.regions.paf1trf4.vs.trf4.1.5.mRNA.divergent.bed
ls

bedtools window -a induced.regions.paf1trf4.vs.trf4.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -Sm -l 0 -r 200   > induced.regions.paf1trf4.vs.trf4.1.5.mRNA.convergent.bed
ls

bedtools window -a induced.regions.paf1trf4.vs.trf4.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -l 200 -r 200 -v > induced.regions.paf1trf4.vs.trf4.1.5.mRNA.intergenic.bed
ls

bedtools intersect -a induced.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed -b induced.regions.paf1trf4.vs.trf4.1.5.mRNA.same.strand.overlapping.bed -s -c | bedtools intersect -a stdin -b induced.regions.paf1trf4.vs.trf4.1.5.mRNA.opposite.strand.overlapping.bed -s -c | bedtools window -a stdin -b induced.regions.paf1trf4.vs.trf4.1.5.mRNA.non.overlapping.bed -w 200  -sm -c | bedtools window -a stdin -b induced.regions.paf1trf4.vs.trf4.1.5.mRNA.upstream.tandem.bed -w 200  -sm -c | bedtools window -a stdin -b induced.regions.paf1trf4.vs.trf4.1.5.mRNA.downstream.tandem.bed -w 200  -sm -c | bedtools window -a stdin -b induced.regions.paf1trf4.vs.trf4.1.5.mRNA.divergent.bed -w 200  -sm -c | bedtools window -a stdin -b induced.regions.paf1trf4.vs.trf4.1.5.mRNA.convergent.bed -w 200  -sm -c | bedtools window -a stdin -b induced.regions.paf1trf4.vs.trf4.1.5.mRNA.intergenic.bed -w 200  -sm -c > induced.regions.paf1trf4.vs.trf4.1.5.master.count.table.txt














bedtools intersect -a repressed.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed -b mRNA.sorted.bed -s -wa > repressed.regions.paf1.vs.wt.1.5.mRNA.same.strand.overlapping.bed
ls

bedtools intersect -a repressed.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed -b mRNA.sorted.bed -S -wa > repressed.regions.paf1.vs.wt.1.5.mRNA.opposite.strand.overlapping.bed
ls

bedtools intersect -a repressed.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed -b mRNA.sorted.bed -v > repressed.regions.paf1.vs.wt.1.5.mRNA.non.overlapping.bed
ls

bedtools window -a repressed.regions.paf1.vs.wt.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -sm -l 200 -r 0   > repressed.regions.paf1.vs.wt.1.5.mRNA.upstream.tandem.bed
ls

bedtools window -a repressed.regions.paf1.vs.wt.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -sm -l 0 -r 200   > repressed.regions.paf1.vs.wt.1.5.mRNA.downstream.tandem.bed
ls

bedtools window -a repressed.regions.paf1.vs.wt.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -Sm -l 200 -r 0   > repressed.regions.paf1.vs.wt.1.5.mRNA.divergent.bed
ls

bedtools window -a repressed.regions.paf1.vs.wt.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -Sm -l 0 -r 200   > repressed.regions.paf1.vs.wt.1.5.mRNA.convergent.bed
ls

bedtools window -a repressed.regions.paf1.vs.wt.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -l 200 -r 200 -v > repressed.regions.paf1.vs.wt.1.5.mRNA.intergenic.bed
ls

bedtools intersect -a repressed.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed -b repressed.regions.paf1.vs.wt.1.5.mRNA.same.strand.overlapping.bed -s -c | bedtools intersect -a stdin -b repressed.regions.paf1.vs.wt.1.5.mRNA.opposite.strand.overlapping.bed -s -c | bedtools window -a stdin -b repressed.regions.paf1.vs.wt.1.5.mRNA.non.overlapping.bed -w 200  -sm -c | bedtools window -a stdin -b repressed.regions.paf1.vs.wt.1.5.mRNA.upstream.tandem.bed -w 200  -sm -c | bedtools window -a stdin -b repressed.regions.paf1.vs.wt.1.5.mRNA.downstream.tandem.bed -w 200  -sm -c | bedtools window -a stdin -b repressed.regions.paf1.vs.wt.1.5.mRNA.divergent.bed -w 200  -sm -c | bedtools window -a stdin -b repressed.regions.paf1.vs.wt.1.5.mRNA.convergent.bed -w 200  -sm -c | bedtools window -a stdin -b repressed.regions.paf1.vs.wt.1.5.mRNA.intergenic.bed -w 200  -sm -c > repressed.regions.paf1.vs.wt.1.5.master.count.table.txt








bedtools intersect -a repressed.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed -b mRNA.sorted.bed -s -wa > repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.same.strand.overlapping.bed
ls

bedtools intersect -a repressed.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed -b mRNA.sorted.bed -S -wa > repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.opposite.strand.overlapping.bed
ls

bedtools intersect -a repressed.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed -b mRNA.sorted.bed -v > repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.non.overlapping.bed
ls

bedtools window -a repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -sm -l 200 -r 0   > repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.upstream.tandem.bed
ls

bedtools window -a repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -sm -l 0 -r 200   > repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.downstream.tandem.bed
ls

bedtools window -a repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -Sm -l 200 -r 0   > repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.divergent.bed
ls

bedtools window -a repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -Sm -l 0 -r 200   > repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.convergent.bed
ls

bedtools window -a repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.non.overlapping.bed -b mRNA.sorted.bed -l 200 -r 200 -v > repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.intergenic.bed
ls

bedtools intersect -a repressed.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed -b repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.same.strand.overlapping.bed -s -c | bedtools intersect -a stdin -b repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.opposite.strand.overlapping.bed -s -c | bedtools window -a stdin -b repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.non.overlapping.bed -w 200  -sm -c | bedtools window -a stdin -b repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.upstream.tandem.bed -w 200  -sm -c | bedtools window -a stdin -b repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.downstream.tandem.bed -w 200  -sm -c | bedtools window -a stdin -b repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.divergent.bed -w 200  -sm -c | bedtools window -a stdin -b repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.convergent.bed -w 200  -sm -c | bedtools window -a stdin -b repressed.regions.paf1trf4.vs.trf4.1.5.mRNA.intergenic.bed -w 200  -sm -c > repressed.regions.paf1trf4.vs.trf4.1.5.master.count.table.txt







