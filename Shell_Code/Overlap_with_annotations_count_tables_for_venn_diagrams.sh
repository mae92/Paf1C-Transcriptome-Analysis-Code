cd /Volumes/Mitch/PaperAnalyses1/A_Overlap_with_Annotated_Regions

ls


#awk -v OFS="\t" '{print $1,$4,$5,$5-$4,$3,$7}' SRAT_ncomms13610-s2.gff > SRAT.bed

#sortBed -i SRAT.bed > SRAT.sorted.bed


cat CUT.sorted.bed SUT.sorted.bed mRNA.sorted.bed snoRNA.sorted.bed XUT.sorted.bed SRAT.sorted.bed NUT.sorted.bed> CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed


cat paf1.vs.wt.minus.denovo.annotation.bed paf1.vs.wt.plus.denovo.annotation.bed > paf1.vs.wt.window.20.1.5fold.annotations.bed

cat paf1trf4.vs.trf4.minus.denovo.annotation.bed paf1trf4.vs.trf4.plus.denovo.annotation.bed > paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed


ls


awk -v OFS="\t" '$5 >= 0 {print}' paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed > repressed.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed

awk -v OFS="\t" '$5 <= 0 {print}' paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed > induced.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed


awk -v OFS="\t" '$5 >= 0 {print}' paf1.vs.wt.window.20.1.5fold.annotations.bed > repressed.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed

awk -v OFS="\t" '$5 <= 0 {print}' paf1.vs.wt.window.20.1.5fold.annotations.bed > induced.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed


#Overlap Same Strand All Annotations Returning table of annotations
intersectBed -c -s -a CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed -b repressed.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed > aaaaa.intersect.repressed.regions.paf1trf4.vs.trf4.window.20.1.5fold.with.CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed


intersectBed -c -s -a CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed -b repressed.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed > aaaaa.intersect.repressed.regions.paf1.vs.wt.window.20.1.5fold.with.CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed


intersectBed -c -s -a CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed -b induced.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed > aaaaa.intersect.induced.regions.paf1trf4.vs.trf4.window.20.1.5fold.with.CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed


intersectBed -c -s -a CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed -b induced.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed > aaaaa.intersect.induced.regions.paf1.vs.wt.window.20.1.5fold.with.CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed



#Overlap Same Strand All Annotations Returning table of PRRs and PIRs
intersectBed -c -s -a repressed.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed -b CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed | intersectBed -c -s -a stdin -b mRNA.sorted.bed | intersectBed -c -s -a stdin -b snoRNA.sorted.bed | intersectBed -c -s -a stdin -b CUT.sorted.bed | intersectBed -c -s -a stdin -b SUT.sorted.bed | intersectBed -c -s -a stdin -b XUT.sorted.bed | intersectBed -c -s -a stdin -b SRAT.sorted.bed | intersectBed -c -S -a stdin -b mRNA.sorted.bed | intersectBed -c -s -a stdin -b aa.no.overlap.repressed.regions.paf1trf4.vs.trf4.window.20.1.5fold.with.CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed > aa.intersect.repressed.regions.paf1trf4.vs.trf4.window.20.1.5fold.with.CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed


intersectBed -c -s -a repressed.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed -b CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed | intersectBed -c -s -a stdin -b mRNA.sorted.bed | intersectBed -c -s -a stdin -b snoRNA.sorted.bed | intersectBed -c -s -a stdin -b CUT.sorted.bed | intersectBed -c -s -a stdin -b SUT.sorted.bed | intersectBed -c -s -a stdin -b XUT.sorted.bed | intersectBed -c -s -a stdin -b SRAT.sorted.bed | intersectBed -c -S -a stdin -b mRNA.sorted.bed | intersectBed -c -s -a stdin -b aa.no.overlap.repressed.regions.paf1.vs.wt.window.20.1.5fold.with.CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed > aa.intersect.repressed.regions.paf1.vs.wt.window.20.1.5fold.with.CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed


intersectBed -c -s -a induced.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed -b CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed | intersectBed -c -s -a stdin -b mRNA.sorted.bed | intersectBed -c -s -a stdin -b snoRNA.sorted.bed | intersectBed -c -s -a stdin -b CUT.sorted.bed | intersectBed -c -s -a stdin -b SUT.sorted.bed | intersectBed -c -s -a stdin -b XUT.sorted.bed | intersectBed -c -s -a stdin -b SRAT.sorted.bed | intersectBed -c -S -a stdin -b mRNA.sorted.bed | intersectBed -c -s -a stdin -b aa.no.overlap.induced.regions.paf1trf4.vs.trf4.window.20.1.5fold.with.CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed > aa.intersect.induced.regions.paf1trf4.vs.trf4.window.20.1.5fold.with.CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed


intersectBed -c -s -a induced.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed -b CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed | intersectBed -c -s -a stdin -b mRNA.sorted.bed | intersectBed -c -s -a stdin -b snoRNA.sorted.bed | intersectBed -c -s -a stdin -b CUT.sorted.bed | intersectBed -c -s -a stdin -b SUT.sorted.bed | intersectBed -c -s -a stdin -b XUT.sorted.bed | intersectBed -c -s -a stdin -b SRAT.sorted.bed | intersectBed -c -S -a stdin -b mRNA.sorted.bed | intersectBed -c -s -a stdin -b aa.no.overlap.induced.regions.paf1.vs.wt.window.20.1.5fold.with.CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed > aa.intersect.induced.regions.paf1.vs.wt.window.20.1.5fold.with.CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed




#No Overlap All Annotations
intersectBed -v -s -a repressed.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed -b CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed > aa.no.overlap.repressed.regions.paf1trf4.vs.trf4.window.20.1.5fold.with.CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed


intersectBed -v -s -a repressed.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed -b CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed > aa.no.overlap.repressed.regions.paf1.vs.wt.window.20.1.5fold.with.CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed


intersectBed -v -s -a induced.regions.paf1trf4.vs.trf4.window.20.1.5fold.annotations.bed -b CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed > aa.no.overlap.induced.regions.paf1trf4.vs.trf4.window.20.1.5fold.with.CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed


intersectBed -v -s -a induced.regions.paf1.vs.wt.window.20.1.5fold.annotations.bed -b CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed > aa.no.overlap.induced.regions.paf1.vs.wt.window.20.1.5fold.with.CUT-SUT-mRNA-snoRNA.XUT.SRAT_NUT.annotations.bed


