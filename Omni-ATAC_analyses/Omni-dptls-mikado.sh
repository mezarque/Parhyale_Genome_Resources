#!/bin/bash
# Job name:
#SBATCH --job-name=dptls-omni
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

echo 'loaded libraries' 

echo 'performing computeMatrix refpoint on mRNAs per stage' 
computeMatrix reference-point -S \
S13A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S13B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S14A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S14B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S15A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S15B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S17A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S17B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S18A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S18B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S19A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S19B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S19plusA_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S19plusB_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S20A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S20B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S21A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S21B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S22A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S22B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S23A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S23B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S24A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S24B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S25A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S25B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S26A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S26B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S27A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S27B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
--regionsFileName mikado.loci.sorted.mRNAs.bed --outFileName OmniATAC_allstages_mikado_mRNA_refpoint.gz \
-b 3000 -a 3000 --numberOfProcessors max --skipZeros --missingDataAsZero

echo 'performing computeMatrix refpoint on mRNAs merged' 
computeMatrix reference-point -S \
OmniATAC_bothruns_bigWigs_merged.bw \
--regionsFileName mikado.loci.sorted.mRNAs.bed --outFileName OmniATAC_merged_mikado_mRNA_refpoint.gz \
-b 3000 -a 3000 --numberOfProcessors max --skipZeros --missingDataAsZero

echo 'performing computeMatrix refpoint on ncRNAs per stage' 
computeMatrix scale-regions -S \
S13A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S13B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S14A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S14B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S15A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S15B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S17A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S17B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S18A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S18B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S19A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S19B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S19plusA_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S19plusB_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S20A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S20B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S21A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S21B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S22A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S22B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S23A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S23B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S24A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S24B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S25A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S25B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S26A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S26B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S27A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S27B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
--regionsFileName mikado.loci.sorted.mRNAs.bed --outFileName OmniATAC_allstages_mikado_mRNA_scaleregions.gz \
-b 3000 -a 3000 --numberOfProcessors max --skipZeros --missingDataAsZero

echo 'performing computeMatrix refpoint on ncRNAs merged' 
computeMatrix scale-regions -S \
OmniATAC_bothruns_bigWigs_merged.bw \
--regionsFileName mikado.loci.sorted.mRNAs.bed --outFileName OmniATAC_merged_mikado_mRNA_scaleregions.gz \
-b 3000 -a 3000 --numberOfProcessors max --skipZeros --missingDataAsZero

plotHeatmap --matrixFile OmniATAC_allstages_mikado_mRNA_refpoint.gz --outFileName OmniATAC_allstages_mikado_mRNA_refpoint.pdf
plotHeatmap --matrixFile OmniATAC_allstages_mikado_mRNA_scaleregions.gz --outFileName OmniATAC_allstages_mikado_mRNA_scaleregions.pdf

plotHeatmap --matrixFile OmniATAC_merged_mikado_mRNA_refpoint.gz --outFileName OmniATAC_merged_mikado_mRNA_refpoint.pdf
plotHeatmap --matrixFile OmniATAC_merged_mikado_mRNA_scaleregions.gz --outFileName OmniATAC_merged_mikado_mRNA_scaleregions.pdf

computeMatrix scale-regions -S \
S13A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S13B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S14A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S14B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S15A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S15B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S17A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S17B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S18A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S18B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S19A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S19B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S19plusA_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S19plusB_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S20A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S20B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S21A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S21B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S22A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S22B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S23A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S23B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S24A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S24B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S25A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S25B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S26A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S26B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S27A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S27B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
--regionsFileName mikado.loci.sorted.ncRNAs.bed --outFileName OmniATAC_allstages_mikado_ncRNA_scaleregions.gz \
-b 3000 -a 3000 --numberOfProcessors max --skipZeros --missingDataAsZero

computeMatrix reference-point -S \
OmniATAC_bothruns_bigWigs_merged.bw \
--regionsFileName mikado.loci.sorted.ncRNAs.bed --outFileName OmniATAC_merged_mikado_ncRNA_refpoint.gz \
-b 3000 -a 3000 --numberOfProcessors max --skipZeros --missingDataAsZero

computeMatrix reference-point -S \
S13A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S13B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S14A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S14B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S15A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S15B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S17A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S17B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S18A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S18B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S19A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S19B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S19plusA_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S19plusB_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S20A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S20B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S21A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S21B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S22A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S22B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S23A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S23B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S24A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S24B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S25A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S25B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S26A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S26B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S27A_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
S27B_bothruns_q10.Genrich_sorted.ATAC.q005.final.bw \
--regionsFileName mikado.loci.sorted.ncRNAs.bed --outFileName OmniATAC_allstages_mikado_ncRNA_refpoint.gz \
-b 3000 -a 3000 --numberOfProcessors max --skipZeros --missingDataAsZero

computeMatrix scale-regions -S \
OmniATAC_bothruns_bigWigs_merged.bw \
--regionsFileName mikado.loci.sorted.ncRNAs.bed --outFileName OmniATAC_merged_mikado_ncRNA_scaleregions.gz \
-b 3000 -a 3000 --numberOfProcessors max --skipZeros --missingDataAsZero

plotHeatmap --matrixFile OmniATAC_allstages_mikado_ncRNA_refpoint.gz --outFileName OmniATAC_allstages_mikado_ncRNA_refpoint.pdf
plotHeatmap --matrixFile OmniATAC_allstages_mikado_ncRNA_scaleregions.gz --outFileName OmniATAC_allstages_mikado_ncRNA_scaleregions.pdf

plotHeatmap --matrixFile OmniATAC_merged_mikado_ncRNA_refpoint.gz --outFileName OmniATAC_merged_mikado_ncRNA_refpoint.pdf
plotHeatmap --matrixFile OmniATAC_merged_mikado_ncRNA_scaleregions.gz --outFileName OmniATAC_merged_mikado_ncRNA_scaleregions.pdf