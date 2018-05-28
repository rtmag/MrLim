#
library(Rsubread)
options(scipen=999)


data<-featureCounts(c(
"/home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/bam/RMH3993_5MM_noINS_noDELAligned.sortedByCoord.out.bam",
"/home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/bam/RMH3994_5MM_noINS_noDELAligned.sortedByCoord.out.bam"),
annot.ext="/logical_dev/resources/gencode.vM17.chr_patch_hapl_scaff.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=1,
isPairedEnd=FALSE,
autosort=TRUE,
nthreads=15,
GTF.featureType="exon", 
GTF.attrType="gene_name")

dat=data[[1]]
colnames(dat)=c("r1","r2")

dat = (dat[rowSums(dat)!=0,])

dat=dat[order(rowMeans(dat),decreasing=T),]

saveRDS(dat,"smallRNA_mrLIM_counts_5MM_noINS_noDEL_softClip_allFeatures.rds")
write.csv(dat,"smallRNA_mrLIM_counts_5MM_noINS_noDEL_softClip_allFeatures.csv")

##########################

data<-featureCounts(c(
"/home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/bam/RMH3993_5MM_noINS_noDELAligned.sortedByCoord.out.bam",
"/home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/bam/RMH3994_5MM_noINS_noDELAligned.sortedByCoord.out.bam"),
annot.ext="/logical_dev/resources/gencode.vM17.chr_patch_hapl_scaff.annotation_MIRNAONLY.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=1,
isPairedEnd=FALSE,
autosort=TRUE,
nthreads=15,
GTF.featureType="exon", 
GTF.attrType="gene_name")

dat=data[[1]]
colnames(dat)=c("r1","r2")

dat = (dat[rowSums(dat)!=0,])

dat=dat[order(rowMeans(dat),decreasing=T),]

saveRDS(dat,"smallRNA_mrLIM_counts_5MM_noINS_noDEL_softClip_miRNAonly.rds")
write.csv(dat,"smallRNA_mrLIM_counts_5MM_noINS_noDEL_softClip_miRNAonly.csv")
##########################


data<-featureCounts(c(
"/home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/bam/RMH3993_Aligned.sortedByCoord.out.bam",
"/home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/bam/RMH3994_Aligned.sortedByCoord.out.bam"),
annot.ext="/logical_dev/resources/gencode.vM17.chr_patch_hapl_scaff.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=1,
isPairedEnd=FALSE,
autosort=TRUE,
nthreads=15,
GTF.featureType="exon", 
GTF.attrType="gene_name")

dat=data[[1]]
colnames(dat)=c("r1","r2")

dat = (dat[rowSums(dat)!=0,])

dat=dat[order(rowMeans(dat),decreasing=T),]

saveRDS(dat,"smallRNA_mrLIM_counts_5MM_EndToEnd_allFeatures.rds")
write.csv(dat,"smallRNA_mrLIM_counts_5MM_EndToEnd_allFeatures.csv")

##########################

data<-featureCounts(c(
"/home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/bam/RMH3993_Aligned.sortedByCoord.out.bam",
"/home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/bam/RMH3994_Aligned.sortedByCoord.out.bam"),
annot.ext="/logical_dev/resources/gencode.vM17.chr_patch_hapl_scaff.annotation_MIRNAONLY.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=1,
isPairedEnd=FALSE,
autosort=TRUE,
nthreads=15,
GTF.featureType="exon", 
GTF.attrType="gene_name")

dat=data[[1]]
colnames(dat)=c("r1","r2")

dat = (dat[rowSums(dat)!=0,])

dat=dat[order(rowMeans(dat),decreasing=T),]

saveRDS(dat,"smallRNA_mrLIM_counts_5MM_EndToEnd_miRNAonly.rds")
write.csv(dat,"smallRNA_mrLIM_counts_5MM_EndToEnd_miRNAonly.csv")
##########################

