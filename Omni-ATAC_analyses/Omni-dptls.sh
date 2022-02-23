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

computeMatrix reference-point -S \
S13A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S13B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S14A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S14B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S15A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S15B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S17A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S17B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S18A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S18B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S19A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S19B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S19plusA_run1_q10.Genrich_sorted.headless.noctrl.bw \
S19plusB_run1_q10.Genrich_sorted.headless.noctrl.bw \
S20A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S20B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S21A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S21B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S22A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S22B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S23A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S23B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S24A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S24B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S25A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S25B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S26A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S26B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S27A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S27B_run1_q10.Genrich_sorted.headless.noctrl.bw \
--regionsFileName phaw_5.0.eggnog.sorted.mRNA.bed --outFileName OmniATAC_allstages_mRNA_refpoint.gz \
-b 3000 -a 3000 --numberOfProcessors max --skipZeros --missingDataAsZero

computeMatrix scale-regions -S \
S13A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S13B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S14A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S14B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S15A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S15B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S17A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S17B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S18A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S18B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S19A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S19B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S19plusA_run1_q10.Genrich_sorted.headless.noctrl.bw \
S19plusB_run1_q10.Genrich_sorted.headless.noctrl.bw \
S20A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S20B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S21A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S21B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S22A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S22B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S23A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S23B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S24A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S24B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S25A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S25B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S26A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S26B_run1_q10.Genrich_sorted.headless.noctrl.bw \
S27A_run1_q10.Genrich_sorted.headless.noctrl.bw \
S27B_run1_q10.Genrich_sorted.headless.noctrl.bw \
--regionsFileName phaw_5.0.eggnog.sorted.mRNA.bed --outFileName OmniATAC_allstages_mRNA_scaleregions.gz \
-b 3000 -a 3000 --numberOfProcessors max --skipZeros --missingDataAsZero

plotHeatmap --matrixFile OmniATAC_allstages_mRNA_refpoint.gz --outFileName OmniATAC_allstages_mRNA_refpoint_heatmap.pdf
plotHeatmap --matrixFile OmniATAC_allstages_mRNA_scaleregions.gz --outFileName OmniATAC_allstages_mRNA_scaleregions_heatmap.pdf