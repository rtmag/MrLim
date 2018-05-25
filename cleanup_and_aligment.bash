#############################################################################################################
# Adapter removel
# "AGATCGGAAGAGC" adapter sequence
trim_galore --illumina -o /home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/trimmed/ \
/home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/RMH3993/RMH3993_MS001-SR-R00548-NoIndex_S1_L001_R1_001.fastq.gz

trim_galore --illumina -o /home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/trimmed/ \
/home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/RMH3994/RMH3994_MS001-SR-R00549-NoIndex_S1_L001_R1_001.fastq.gz
#############################################################################################################
# Genome index Preparation
STAR --runThreadN 5 --runMode genomeGenerate --genomeDir \
/logical_dev/resources/star_hg38_noAnnotation \
--genomeFastaFiles /logical_dev/resources/hg38_allchr.fasta
#############################################################################################################
# Aligment
STAR --genomeDir /logical_dev/resources/hg38_noanno/ \
--readFilesCommand zcat --runThreadN 12 \
--outFilterMismatchNoverLmax 0.05 --outFilterMatchNmin 16 --outFilterScoreMinOverLread 0 \
--outFilterMatchNminOverLread 0 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/trimmed/RMH3993_MS001-SR-R00548-NoIndex_S1_L001_R1_001_trimmed.fq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/bam/RMH3993_ 

STAR --genomeDir /logical_dev/resources/hg38_noanno/ \
--readFilesCommand zcat --runThreadN 12 \
--outFilterMismatchNoverLmax 0.05 --outFilterMatchNmin 16 --outFilterScoreMinOverLread 0 \
--outFilterMatchNminOverLread 0 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/trimmed/RMH3994_MS001-SR-R00549-NoIndex_S1_L001_R1_001_trimmed.fq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/bam/RMH3994_ 
###############################################################################################################
# Aligment 10% MM noE2E
STAR --genomeDir /logical_dev/resources/hg38_noanno/ \
--readFilesCommand zcat --runThreadN 12 \
--outFilterMismatchNoverLmax 0.10 --outFilterMatchNmin 16 --outFilterScoreMinOverLread 0 \
--outFilterMatchNminOverLread 0 --alignIntronMax 1 \
--readFilesIn /home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/trimmed/RMH3993_MS001-SR-R00548-NoIndex_S1_L001_R1_001_trimmed.fq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/bam/RMH3993_10MM_ 

STAR --genomeDir /logical_dev/resources/hg38_noanno/ \
--readFilesCommand zcat --runThreadN 12 \
--outFilterMismatchNoverLmax 0.10 --outFilterMatchNmin 16 --outFilterScoreMinOverLread 0 \
--outFilterMatchNminOverLread 0 --alignIntronMax 1 \
--readFilesIn /home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/trimmed/RMH3994_MS001-SR-R00549-NoIndex_S1_L001_R1_001_trimmed.fq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /home/rtm/CSI/mrLim/2018_05_17_13_50_30_833/bam/RMH3994_10MM_ 
###############################################################################################################
