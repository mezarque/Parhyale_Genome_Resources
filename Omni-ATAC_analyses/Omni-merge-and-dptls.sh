#!/bin/bash
# Job name:
#SBATCH --job-name=fragsize
#
# Account:
#SBATCH --account=co_rosalind
#
# Partition:
#SBATCH --partition=savio2_htc
#
# Request one node:
#SBATCH --nodes=1
#
# Specify one task:
#SBATCH --ntasks-per-node=1
#
# Number of processors for single task needed for use case (example):
#SBATCH --cpus-per-task=12
#
# Mail type:
#SBATCH --mail-type=all
#
# Mail user:
#SBATCH --mail-user=dennis.a.sun@berkeley.edu
#
# Wall clock limit:
#SBATCH --time=72:00:00
#
# Requeues job upon preemption:
#SBATCH --requeue
#
## Command(s) to run:

module load python
source activate deeptools

sort -k1,1 -k2,2n Omni_ATAC_bigWigs_merged.bedgraph > Omni_ATAC_bigWigs_sorted_merged.bedgraph 

./bedGraphToBigWig Omni_ATAC_bigWigs_sorted_merged.bedgraph phaw_5.0.chrom.sizes Omni_ATAC_bigWigs_merged.bw

computeMatrix reference-point -S \
Omni_ATAC_bigWigs_merged.bw \
--regionsFileName phaw_5.0.eggnog.sorted.mRNA.bed --outFileName OmniATAC_merged_mRNA_refpoint.gz \
-b 3000 -a 3000 --numberOfProcessors max --skipZeros --missingDataAsZero

computeMatrix scale-regions -S \
Omni_ATAC_bigWigs_merged.bw \
--regionsFileName phaw_5.0.eggnog.sorted.mRNA.bed --outFileName OmniATAC_merged_mRNA_scaleregions.gz \
-b 3000 -a 3000 --numberOfProcessors max --skipZeros --missingDataAsZero

plotHeatmap --matrixFile OmniATAC_merged_mRNA_refpoint.gz --outFileName OmniATAC_merged_mRNA_refpoint_heatmap.pdf
plotHeatmap --matrixFile OmniATAC_merged_mRNA_scaleregions.gz --outFileName OmniATAC_merged_mRNA_scaleregions_heatmap.pdf