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

load("~/Desktop/RDA_Files/makeProbeAnno-hits.rda")

if(!exists("whPM")) {
  whPM = which(hits[, "unique"]!=2)
  print(table(hits[,"unique"]))
  ##       0       1       2       3 
  ## 2834296   42118 2099819  937386 
}

load("~/Desktop/RDA_Files/Scerevisiaetilingprobe.rda")




##--------------------------------------------------
##
## Part 3
##
## The along-chromosome data in 'probeAnno'
##--------------------------------------------------
if("probeAnno1" %in% what) { 
  ## group PMs by chromosome and strand
  cat("Making probeanno: ")
  sp = split(whPM, list(chr=hits[whPM, "chr"], strand=c("-", "+")[(3+hits[whPM, "strand"])/2]))
  probeAnno = new.env()
  for(i in seq(along=sp)) {
    whc = sp[[i]]
    nm  = names(sp)[i]
    cat(nm, "")
    assign(paste(nm, "start", sep="."),  as.integer(hits[whc, "start"]), envir=probeAnno)
    assign(paste(nm, "end", sep="."),    as.integer(hits[whc, "start"]+hits[whc, "length"]-1),
           envir=probeAnno)
    assign(paste(nm, "index", sep="."),  as.integer(hits[whc, "seqId"]),  envir=probeAnno)
    assign(paste(nm, "unique", sep="."), as.integer(hits[whc, "unique"]), envir=probeAnno)
  }
  cat("\n")
}

##--------------------------------------------------
## Part 4: gff
##--------------------------------------------------
if("gff" %in% what) { 
  nrchr = 17 # number of chromosomes
  ## GFF Files
  gffRead = function(gffFile) {
    cat("Reading ", gffFile, ": ", sep="")
    gff = read.table(gffFile, sep="\t", as.is=TRUE, quote="", header=FALSE, comment.char="#",
                     colClasses=c("factor", "factor", "factor", "integer", "integer",
                                  "factor", "factor", "factor", "character"))
    colnames(gff) = c("seqname", "source", "feature", "start", "end",
                      "score", "strand", "frame", "attributes")
    cat("found", nrow(gff), "rows with classes:", paste(sapply(gff, class), collapse=", "), "\n")
    stopifnot(!any(is.na(gff$start)), !any(is.na(gff$end)))
    return(gff)
  }
  
  ## also read the regulatory features:
  gff = gffRead("~/Desktop/Genome_Files/S288C_reference_genome_R64-2-1_20150113/saccharomyces_cerevisiae_R64-2-1_20150113.gff")
  #gff2 = gffRead("SGD-0508/scerevisiae_regulatory.gff.rtf")
  
   #changed on Aug 31, 2005 to include corrected binding site info, J
  #gff2     <- gffRead("~/Desktop/Genome_Files/IGR_v24.2.p001.allowoverlap.GFF")
   #prepare updated binding site info for adding to gff; 2005-08-31 J
  #gff2[,1] <- paste("chr",gff2[,1],sep="") 
  #gff2[,3] <- "TF_binding_site"
  #bsName <- function(x){
    #x2 <- gsub("^.*Site[[:space:]]?","",x)
    #x3 <- gsub(";$","", x2)
   #return(paste(x,"Name=",x3,"-binding-site",sep=""))
  #}
  #gff2[,9] <- sapply(gff2[,9],bsName)
  
  #gff  = rbind(gff1, gff2)
  
  
   #2005/09/30: recover uORFs from replaced gff_regulatory:
  #gff3 <- gffRead("~/Desktop/Genome_Files/SGD-0508scerevisiae_regulatory.gff")
   #discard everything but uORFs, because better info available
  #gff3 <- gff3[gff3$feature=="uORF",]
  #gff  <- rbind(gff,gff3)
  
  ## Add additional useful fields
  gff$Name = getAttributeField(gff$attributes, "Name")
  
  #theID    = getAttributeField(gff$attributes, "ID")
  #stopifnot(all(gff$Name == theID, na.rm=TRUE))
  #gff$Name[is.na(gff$Name)] <- theID[is.na(gff$Name)]
  
  gff$orf_classification = getAttributeField(gff$attributes, "orf_classification")
  gff$gene               = getAttributeField(gff$attributes, "gene")
  
  gff$chr = match(gff$seqname,
                  c("chrI", "chrII", "chrIII", "chrIV",
                    "chrV", "chrVI", "chrVII", "chrVIII", "chrIX",
                    "chrX", "chrXI", "chrXII", "chrXIII", "chrXIV",
                    "chrXV","chrXVI", "chrmt"))
  
  stopifnot(!any(is.na(gff$chr)), !any(gff$chr<1), !any(gff$chr>nrchr))
  
  # 2005/08/24: added "CDS_dubious" as new (more precise) feature description
  gff$feature <- as.character(gff$feature)
  gff$feature[gff$feature=="CDS" & gff[,"orf_classification"]=="Dubious"] <- "CDS_dubious"
}

##--------------------------------------------------
## Part 5: the per-probe data in 'probeAnno'
##--------------------------------------------------
if("probeAnno2" %in% what) { 
  featNames = c("no_feature", "CDS", "ncRNA", "nc_primary_transcript",
                "rRNA", "snRNA", "snoRNA", "tRNA")
  selGff  = which(gff$feature %in% featNames)  
  sgff    = gff[selGff, ]
  
  stopifnot(nrow(sgff)>1000)
  stopifnot(all(sgff$strand %in% c("+", "-")))  
  
  for(hybeType in c("Reverse", "Direct")) {
    cat("-----", hybeType, "-----\n")
    p = lapply(featNames, function(i) character(nrProbes))
    names(p) = featNames
    
    ## loop over chromosomes and strands
    for(s in c("+", "-")) {
      pas = switch(hybeType,
                   Reverse = s,
                   Direct  = otherStrand(s)
      )
      for(chr in 1:nrchr) {
        ifeat  = which(sgff$strand == s & sgff$chr == chr)
        cat(chr, s, ": ", length(ifeat), " features\n", sep="")
        
        k1   = sgff[ifeat, "start"]
        k2   = sgff[ifeat, "end"]
        Name = sgff[ifeat, "Name"]
        feat = as.character(sgff[ifeat, "feature"])
        stopifnot(all(k1<=k2))
        
        sta = get(paste(chr, pas, "start", sep="."), envir=probeAnno)
        end = get(paste(chr, pas, "end",   sep="."), envir=probeAnno)
        ind = get(paste(chr, pas, "index", sep="."), envir=probeAnno)
        
        for(i in seq(along=ifeat)) {
          sel = (sta>=k1[i] & end<=k2[i])
          p[[feat[i]]][ind[sel]] = Name[i]
        } ## for i
      } ## for chr
    } ## for s
    
    ## now set 'no_feature' to all PMs that are not something else:
    anyFeature = which(0 < rowSums(sapply(p, function(s) s!="")))
    allProbes = unique(unlist(mget(paste(
      rep(1:nrchr, each=2), rep(c("+", "-"), nrchr), "index", sep="."),
      envir=probeAnno)))
    
    p[["no_feature"]][setdiff(allProbes, anyFeature)] = "no" 
    cat("length(allProbes)=", length(allProbes),
        "length(anyFeature)=", length(anyFeature),
        "no feature=", length(which(p[["no_feature"]]=="no")), "\n")
    
    for(i in 1:length(p))
      p[[i]] = factor(p[[i]])
    
    assign(paste("probe", hybeType, sep=""), p, envir=probeAnno)
  } ## for hybetype
  cat("\n")
}

##
##  save
##
if("probeAnnoSave" %in% what) { 
  cat("Saving probeAnno.rda.\n")
  ## this was used mostly in the analysis
  save(probeAnno, gff, file="~/Desktop/probeAnno+GFF.rda", compress=TRUE)
}