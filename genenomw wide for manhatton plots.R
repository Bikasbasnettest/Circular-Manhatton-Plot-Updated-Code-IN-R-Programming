library(qqman)
library(circlize)

# Make sure WEIR_AND_COCKERHAM_FST is numeric (convert if needed)
bikas$WEIR_AND_COCKERHAM_FST <- as.numeric(bikas$WEIR_AND_COCKERHAM_FST)

# Define the chromosome regions where the points will be plotted
regions <- data.frame(
  chr = bikas$CHROM,
  start = bikas$POS,
  end = bikas$POS
)

# Create a vector of colors based on the WEIR_AND_COCKERHAM_FST values
color_vector <- ifelse(bikas$WEIR_AND_COCKERHAM_FST > median(bikas$WEIR_AND_COCKERHAM_FST),
                       "red", "black")

# Initialize the plotting device (e.g., PNG)
png("genomic_points_plot.png")

# Create a genomic plot with points and custom colors
circos.initializeWithIdeogram(plotType = NULL)

# Create multiple tracks with varying ylim values
for (i in 1:100) {
  ylim_min <- 0.2 * (i - 1)
  ylim_max <- 0.2 * i
  
  circos.track(ylim = c(ylim_min, ylim_max))
  
  # Add points to the new track
  circos.points(
    x = bikas$CHROM,
    y = bikas$POS,
    col = color_vector,
    pch = 16,
    cex = 1
  )
}

# Close the PNG plotting device
dev.off()






setwd("C:/Users/HP/OneDrive/Desktop")
bikas<-read.csv("C:/Users/HP/OneDrive/Desktop/GWAS.csv",header = TRUE)
print(bikas)
head(bikas)
tail(bikas)
dim(bikas)
#to change the color of the Plots.
manhattan(bikas,chr='CHROM', bp='POS',
          p="WEIR_AND_COCKERHAM_FST",snp='SNP',col=c("black","red"),
          logp=FALSE,ylab='LOD score Value',xlab='Chromosomes')

#we can also annotate SNPs based on their fst values. 
#we do that by specifying a threshold using the annotatePval parameter
#by default, qqman only annotates the top SNP per chromosome that exceeds the threshold.
#lets use an fst threshold of 0.2
manhattan(bikas,chr='CHROM',bp='POS',
          p="WEIR_AND_COCKERHAM_FST",snp='SNP',col=c("black", "red"),
          logp=FALSE,annotatePval = 0.2)

#annotate snps with fst values 0.7
manhattan(bikas,chr='CHROM',bp='POS',
          p="WEIR_AND_COCKERHAM_FST",snp='SNP',col=c("black", "red"),
          logp=FALSE,annotatePval = 0.7,annotateTop = TRUE)

#highlight all hits. 
#to do that, we change the annotateTop parameter to False
manhattan(bikas,chr='CHROM',bp='POS',
          p="WEIR_AND_COCKERHAM_FST",snp='SNP',col=c("black", "red"),
          logp=FALSE,annotatePval = 0.7,annotateTop = F)

#let's add a genomewide line.
manhattan(bikas,chr='CHROM',bp='POS',
          p="WEIR_AND_COCKERHAM_FST",snp='SNP',col=c("black", "blue"),
          suggestiveline = F,genomewideline = 0.5,logp=FALSE,ylab='WEIR AND COCKERHAM_FST',xlab='CHR')


#highlight snp(s) of interest
snps_of_interest=c("SNP 1422","SNP 20367","SNP 7412")
manhattan(bikas,chr='CHROM',bp='POS',
          p="WEIR_AND_COCKERHAM_FST",snp='SNP',col=c("black", "red"),
          logp=FALSE,ylab='WEIR AND COCKERHAM_FST',xlab='CHR',highlight=snps_of_interest)
