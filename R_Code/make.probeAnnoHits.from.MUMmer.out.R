##--------------------------------------------------------------------------------
## Use the output from the MUMmer (querying all probes on the chip vs genome)
## to construct probe annotaton datastructures
##
## 06.8.2005: Use MUMmer instead of BLAST
## 21.5.2005: Use also probes shorter than 25 bases
## 13.5.2005: Write arrayDesign.txt file for ArrayExpress
##
## The script has the following parts
## 1. Read and process scAll.out
## 2. Write arrayDesign.txt
## 3. Construct along-chromosome vectors for probeAnno environment:
##    start, end: (integer) 
##    index: index (1...6553600) of the PM on the chip (integer) 
##    unique: whether the probe hits multiple places (logical)
## 4. Construct GFF dataframe
## 5. Construct probeAnnoReverse and probeAnnoDirect lists
## 6. Write 3-5 into probeAnno.rda
##--------------------------------------------------------------------------------
library("tilingArray")
library("davidTiling")

options(error=recover)

arraySize   = 2560
nrProbes    = arraySize*arraySize

what = c("hits", "arrayexpress", "probeAnno1", "gff", "probeAnno2", "probeAnnoSave")

if("hits" %in% what) {
  ## read the MUMmer output, parse and process
  mmRes = readLines("~/Desktop/Genome_Files/scAll.out")
  
  ## ------------------------------------------------------------------------
  ## parse the sequence header lines and read them into three integer vectors
  ## seqId, seqDir, seqLen
  ## ------------------------------------------------------------------------
  seqj  = grep("^>", mmRes) 
  
  seqLines = sub("Reverse  Len =", "-1", mmRes[seqj])
  seqLines = sub(" Len =", "1", seqLines)
  seqLines = sub("> ", "", seqLines)
  sp  = strsplit(seqLines, " ")
  stopifnot(all(listLen(sp)==3))
  spi = matrix(as.integer(unlist(sp)), nrow=3)
  seqLen   = spi[3,]
  seqDir   = spi[2,]
  seqId    = spi[1,]
  
  odd  = seq(1, length(seqId), by=2)
  even = seq(2, length(seqId), by=2)
  stopifnot(all(seqDir==c(1,-1)), all(seqId[odd]==seqId[even]))
  
  rm(list=c("seqLines", "seqDir", "sp", "spi"))
  
  chromoAccno = paste("ref|NC_001", c(133:148, 224), "|", sep="")
  
  ## --------------------------------------------------------------------
  ## parse the hit lines and put results into matrix 'hit', with columns:
  ##  seqId:      1..65536000
  ##  chr:        1..17
  ##  strand:     -1, +1 (+1 for Watson/sense, -1 for Crick/antisense)
  ##  start:      1...n. "start" is always the numerically lowest
  ##              coordinate, i.e. the 5' base for Watson strand, the 3'
  ##              base for Crick strand!
  ##  length:     1...L
  ##  unique:     3: has multiple perfect matches (PMs) in the genome
  ##              2: has no PM but one or more near-matches 
  ##              1: has exactly one PM and some near-matches in the genome
  ##              0: has exactly one PM and no near-matches
  ## Here, what is a near match is determined by the parameter settings of
  ## mummer, see 'mapProbesToGenome.sh'. In particular, with he parameter
  ## "-l 23" we require at least a perfect match of 23 probes
  ## ---------------------------------------------------------------------
  
  hits = matrix(as.integer(NA), nrow=length(mmRes)-length(seqLen), ncol=6)
  colnames(hits) = c("seqId", "chr", "strand", "start", "length", "unique")
  k = 0
  jstart = seqj+1
  jend   = c(seqj[-1]-1, length(mmRes)-1)
  
  ## this for-loop will run for about 1-2h...
  for(i in odd) {
    if(i%%10000==1)
      cat(i, "")
    jf = jstart[i]  : jend[i]
    jr = jstart[i+1]: jend[i+1]
    if(jf[length(jf)]<jf[1])
      jf=integer(0)
    if(jr[length(jr)]<jr[1])
      jr=integer(0)
    j  = c(jf, jr)
    if(length(j)>0) {
      sl      = seqLen[i]
      strand  = rep(c(+1, -1), c(length(jf), length(jr)))
      sp      = strsplit(mmRes[j], " +", perl=TRUE)
      stopifnot(all(listLen(sp)==5), all(sapply(sp, "[", 1)==""))
      chr     = match(sapply(sp, "[", 2), chromoAccno)
      stopifnot(!any(is.na(chr)))
      start   = as.integer(sapply(sp, "[", 3))
      posQur  = as.integer(sapply(sp, "[", 4))
      lenMt   = as.integer(sapply(sp, "[", 5))
      isPM    = (lenMt==sl)
      stopifnot( all (!isPM | ((sl/2+0.5)-(sl/2-0.5)*strand==posQur)))
      uniq    = if(sum(isPM)==1) {
        as.integer(!all(isPM))
      } else {
        2 + (sum(isPM)>1)
      }
      hits[k+seq(along=j), ] = cbind(seqId[i], chr, strand, start, sl, uniq)
      k = k+length(j)
    }
  }
  
  stopifnot(k==nrow(hits))
  save(hits, file="~/Desktop/makeProbeAnno-hits.rda")
  
}  else {
    ## read the cached file "hits"
   if(!exists("hits")) {
  
      cat("Loading makeProbeAnno-hits.rda\n")
      load("~/Desktop/makeProbeAnno-hits.rda")
      
    }
  } ## if 

if(!exists("whPM")) {
  whPM = which(hits[, "unique"]!=2)
  print(table(hits[,"unique"]))
  ##       0       1       2       3 
  ## 2834296   42118 2099819  937386 
}
