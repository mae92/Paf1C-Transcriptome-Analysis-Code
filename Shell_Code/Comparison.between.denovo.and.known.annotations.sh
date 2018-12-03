#intersect with known transcript classes

cd /Volumes/Mitch/PaperAnalyses1/A_Overlap_with_Annotated_Regions
ls

head CUT.sorted.bed
head SUT.sorted.bed
head XUT.sorted.bed
head mRNA.sorted.bed
head snoRNA.sorted.bed
head NUT.sorted.bed


#sortBed -i CUT.bed > CUT.sorted.bed
#sortBed -i SUT.bed > SUT.sorted.bed
#sortBed -i XUTs.bed > XUTs.sorted.bed
#sortBed -i antisense.bed > antisense.sorted.bed
#sortBed -i mRNA.bed > mRNA.sorted.bed
#sortBed -i snoRNA.bed > snoRNA.sorted.bed
#sortBed -i NUT.sorted.bed > NUT.sorted.sorted.bed
#SRAT.sorted.bed already existed in this folder


##paf1trf4 vs trf4


#NUTs
intersectBed -a NUT.sorted.bed -b paf1trf4.vs.trf4.minus.decreased.bed -s -u -wa > AA_NUT.paf1trf4.vs.trf4.minus.decreased.bed
intersectBed -a NUT.sorted.bed -b paf1trf4.vs.trf4.minus.increased.bed -s -u -wa > AA_NUT.paf1trf4.vs.trf4.minus.increased.bed
intersectBed -a NUT.sorted.bed -b paf1trf4.vs.trf4.plus.decreased.bed -s -u -wa > AA_NUT.paf1trf4.vs.trf4.plus.decreased.bed
intersectBed -a NUT.sorted.bed -b paf1trf4.vs.trf4.plus.increased.bed -s -u -wa > AA_NUT.paf1trf4.vs.trf4.plus.increased.bed


#CUTs
intersectBed -a CUT.sorted.bed -b paf1trf4.vs.trf4.minus.decreased.bed -s -u -wa > AA_CUT.paf1trf4.vs.trf4.minus.decreased.bed
intersectBed -a CUT.sorted.bed -b paf1trf4.vs.trf4.minus.increased.bed -s -u -wa > AA_CUT.paf1trf4.vs.trf4.minus.increased.bed
intersectBed -a CUT.sorted.bed -b paf1trf4.vs.trf4.plus.decreased.bed -s -u -wa > AA_CUT.paf1trf4.vs.trf4.plus.decreased.bed
intersectBed -a CUT.sorted.bed -b paf1trf4.vs.trf4.plus.increased.bed -s -u -wa > AA_CUT.paf1trf4.vs.trf4.plus.increased.bed


#SUTs
intersectBed -a SUT.sorted.bed -b paf1trf4.vs.trf4.minus.decreased.bed -s -u -wa > AA_SUT.paf1trf4.vs.trf4.minus.decreased.bed
intersectBed -a SUT.sorted.bed -b paf1trf4.vs.trf4.minus.increased.bed -s -u -wa > AA_SUT.paf1trf4.vs.trf4.minus.increased.bed
intersectBed -a SUT.sorted.bed -b paf1trf4.vs.trf4.plus.decreased.bed -s -u -wa > AA_SUT.paf1trf4.vs.trf4.plus.decreased.bed
intersectBed -a SUT.sorted.bed -b paf1trf4.vs.trf4.plus.increased.bed -s -u -wa > AA_SUT.paf1trf4.vs.trf4.plus.increased.bed


#XUTs
intersectBed -a XUT.sorted.bed -b paf1trf4.vs.trf4.minus.decreased.bed -s -u -wa > AA_XUTs.paf1trf4.vs.trf4.minus.decreased.bed
intersectBed -a XUT.sorted.bed -b paf1trf4.vs.trf4.minus.increased.bed -s -u -wa > AA_XUTs.paf1trf4.vs.trf4.minus.increased.bed
intersectBed -a XUT.sorted.bed -b paf1trf4.vs.trf4.plus.decreased.bed -s -u -wa > AA_XUTs.paf1trf4.vs.trf4.plus.decreased.bed
intersectBed -a XUT.sorted.bed -b paf1trf4.vs.trf4.plus.increased.bed -s -u -wa > AA_XUTs.paf1trf4.vs.trf4.plus.increased.bed


#snoRNAs
intersectBed -a snoRNA.sorted.bed -b paf1trf4.vs.trf4.minus.decreased.bed -s -u -wa > AA_snoRNA.paf1trf4.vs.trf4.minus.decreased.bed
intersectBed -a snoRNA.sorted.bed -b paf1trf4.vs.trf4.minus.increased.bed -s -u -wa > AA_snoRNA.paf1trf4.vs.trf4.minus.increased.bed
intersectBed -a snoRNA.sorted.bed -b paf1trf4.vs.trf4.plus.decreased.bed -s -u -wa > AA_snoRNA.paf1trf4.vs.trf4.plus.decreased.bed
intersectBed -a snoRNA.sorted.bed -b paf1trf4.vs.trf4.plus.increased.bed -s -u -wa > AA_snoRNA.paf1trf4.vs.trf4.plus.increased.bed


#mRNAs
intersectBed -a mRNA.sorted.bed -b paf1trf4.vs.trf4.minus.decreased.bed -s -u -wa > AA_mRNA.paf1trf4.vs.trf4.minus.decreased.bed
intersectBed -a mRNA.sorted.bed -b paf1trf4.vs.trf4.minus.increased.bed -s -u -wa > AA_mRNA.paf1trf4.vs.trf4.minus.increased.bed
intersectBed -a mRNA.sorted.bed -b paf1trf4.vs.trf4.plus.decreased.bed -s -u -wa > AA_mRNA.paf1trf4.vs.trf4.plus.decreased.bed
intersectBed -a mRNA.sorted.bed -b paf1trf4.vs.trf4.plus.increased.bed -s -u -wa > AA_mRNA.paf1trf4.vs.trf4.plus.increased.bed


#SRATs
intersectBed -a SRAT.sorted.bed -b paf1trf4.vs.trf4.minus.decreased.bed -s -u -wa > AA_SRAT.paf1trf4.vs.trf4.minus.decreased.bed
intersectBed -a SRAT.sorted.bed -b paf1trf4.vs.trf4.minus.increased.bed -s -u -wa > AA_SRAT.paf1trf4.vs.trf4.minus.increased.bed
intersectBed -a SRAT.sorted.bed -b paf1trf4.vs.trf4.plus.decreased.bed -s -u -wa > AA_SRAT.paf1trf4.vs.trf4.plus.decreased.bed
intersectBed -a SRAT.sorted.bed -b paf1trf4.vs.trf4.plus.increased.bed -s -u -wa > AA_SRAT.paf1trf4.vs.trf4.plus.increased.bed




##paf1 vs wt


#NUTs
intersectBed -a NUT.sorted.bed -b paf1.vs.wt.minus.decreased.bed -s -u -wa > AA_NUTs.paf1.vs.wt.minus.decreased.bed
intersectBed -a NUT.sorted.bed -b paf1.vs.wt.minus.increased.bed -s -u -wa > AA_NUTs.paf1.vs.wt.minus.increased.bed
intersectBed -a NUT.sorted.bed -b paf1.vs.wt.plus.decreased.bed -s -u -wa > AA_NUTs.paf1.vs.wt.plus.decreased.bed
intersectBed -a NUT.sorted.bed -b paf1.vs.wt.plus.increased.bed -s -u -wa > AA_NUTs.paf1.vs.wt.plus.increased.bed


#CUTs
intersectBed -a CUT.sorted.bed -b paf1.vs.wt.minus.decreased.bed -s -u -wa > AA_CUT.paf1.vs.wt.minus.decreased.bed
intersectBed -a CUT.sorted.bed -b paf1.vs.wt.minus.increased.bed -s -u -wa > AA_CUT.paf1.vs.wt.minus.increased.bed
intersectBed -a CUT.sorted.bed -b paf1.vs.wt.plus.decreased.bed -s -u -wa > AA_CUT.paf1.vs.wt.plus.decreased.bed
intersectBed -a CUT.sorted.bed -b paf1.vs.wt.plus.increased.bed -s -u -wa > AA_CUT.paf1.vs.wt.plus.increased.bed


#SUTs
intersectBed -a SUT.sorted.bed -b paf1.vs.wt.minus.decreased.bed -s -u -wa > AA_SUT.paf1.vs.wt.minus.decreased.bed
intersectBed -a SUT.sorted.bed -b paf1.vs.wt.minus.increased.bed -s -u -wa > AA_SUT.paf1.vs.wt.minus.increased.bed
intersectBed -a SUT.sorted.bed -b paf1.vs.wt.plus.decreased.bed -s -u -wa > AA_SUT.paf1.vs.wt.plus.decreased.bed
intersectBed -a SUT.sorted.bed -b paf1.vs.wt.plus.increased.bed -s -u -wa > AA_SUT.paf1.vs.wt.plus.increased.bed


#XUTs
intersectBed -a XUT.sorted.bed -b paf1.vs.wt.minus.decreased.bed -s -u -wa > AA_XUTs.paf1.vs.wt.minus.decreased.bed
intersectBed -a XUT.sorted.bed -b paf1.vs.wt.minus.increased.bed -s -u -wa > AA_XUTs.paf1.vs.wt.minus.increased.bed
intersectBed -a XUT.sorted.bed -b paf1.vs.wt.plus.decreased.bed -s -u -wa > AA_XUTs.paf1.vs.wt.plus.decreased.bed
intersectBed -a XUT.sorted.bed -b paf1.vs.wt.plus.increased.bed -s -u -wa > AA_XUTs.paf1.vs.wt.plus.increased.bed


#snoRNAs
intersectBed -a snoRNA.sorted.bed -b paf1.vs.wt.minus.decreased.bed -s -u -wa > AA_snoRNA.paf1.vs.wt.minus.decreased.bed
intersectBed -a snoRNA.sorted.bed -b paf1.vs.wt.minus.increased.bed -s -u -wa > AA_snoRNA.paf1.vs.wt.minus.increased.bed
intersectBed -a snoRNA.sorted.bed -b paf1.vs.wt.plus.decreased.bed -s -u -wa > AA_snoRNA.paf1.vs.wt.plus.decreased.bed
intersectBed -a snoRNA.sorted.bed -b paf1.vs.wt.plus.increased.bed -s -u -wa > AA_snoRNA.paf1.vs.wt.plus.increased.bed


#mRNAs
intersectBed -a mRNA.sorted.bed -b paf1.vs.wt.minus.decreased.bed -s -u -wa > AA_mRNA.paf1.vs.wt.minus.decreased.bed
intersectBed -a mRNA.sorted.bed -b paf1.vs.wt.minus.increased.bed -s -u -wa > AA_mRNA.paf1.vs.wt.minus.increased.bed
intersectBed -a mRNA.sorted.bed -b paf1.vs.wt.plus.decreased.bed -s -u -wa > AA_mRNA.paf1.vs.wt.plus.decreased.bed
intersectBed -a mRNA.sorted.bed -b paf1.vs.wt.plus.increased.bed -s -u -wa > AA_mRNA.paf1.vs.wt.plus.increased.bed


#SRATs
intersectBed -a SRAT.sorted.bed -b paf1.vs.wt.minus.decreased.bed -s -u -wa > AA_SRAT.paf1.vs.wt.minus.decreased.bed
intersectBed -a SRAT.sorted.bed -b paf1.vs.wt.minus.increased.bed -s -u -wa > AA_SRAT.paf1.vs.wt.minus.increased.bed
intersectBed -a SRAT.sorted.bed -b paf1.vs.wt.plus.decreased.bed -s -u -wa > AA_SRAT.paf1.vs.wt.plus.decreased.bed
intersectBed -a SRAT.sorted.bed -b paf1.vs.wt.plus.increased.bed -s -u -wa > AA_SRAT.paf1.vs.wt.plus.increased.bed







