#!/bin/bash
# Job name:
#SBATCH --job-name=dptls-omni
#
# Account:
#SBATCH --account=co_rosalind
#
# Partition:
#SBATCH --partition=savio_bigmem
#
# Request one node:
#SBATCH --nodes=1
#
# Specify one task:
#SBATCH --ntasks-per-node=1
#
# Number of processors for single task needed for use case (example):
#SBATCH --cpus-per-task=20
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
# QoS:
#SBATCH --qos=savio_lowprio
#
## Command(s) to run:
module load bedtools

#Concatenates peaks into a single file
cat S13A_run1_q10.Genrich_sorted.ATAC.q005.narrowPeak \
S14A_run1_q10.Genrich_sorted.ATAC.q005.narrowPeak \
S15A_run1_q10.Genrich_sorted.ATAC.q005.narrowPeak \
S17A_run1_q10.Genrich_sorted.ATAC.q005.narrowPeak \
S18A_run1_q10.Genrich_sorted.ATAC.q005.narrowPeak \
S19A_run1_q10.Genrich_sorted.ATAC.q005.narrowPeak \
S19plusA_run1_q10.Genrich_sorted.ATAC.q005.narrowPeak \
S20A_run1_q10.Genrich_sorted.ATAC.q005.narrowPeak \
S21A_run1_q10.Genrich_sorted.ATAC.q005.narrowPeak \
S22A_run1_q10.Genrich_sorted.ATAC.q005.narrowPeak \
S23A_run1_q10.Genrich_sorted.ATAC.q005.narrowPeak \
S24A_run1_q10.Genrich_sorted.ATAC.q005.narrowPeak \
S25A_run1_q10.Genrich_sorted.ATAC.q005.narrowPeak \
S26A_run1_q10.Genrich_sorted.ATAC.q005.narrowPeak \
S27A_run1_q10.Genrich_sorted.ATAC.q005.narrowPeak > OmniATAC_q005_allpeaks.bed

#Sorts files together
bedtools sort -i OmniATAC_q005_allpeaks.bed > OmniATAC_q005_allpeaks.sorted.bed

#Merges peaks using bedtools
bedtools merge -c 5,5,7,8,8,9,9 -o count,mean,mean,max,min,max,min -i OmniATAC_q005_allpeaks.sorted.bed > OmniATAC_q005_allpeaks.metrics.bed

awk '{print $1 "\t" $2 "\t" $3 "\t" "COUNT=" $4 ";SCORE_MEAN=" $5 ";SIGNAL_MEAN=" $6 ";-log10(p)_MAX=" $7 ";-log10(p)_MIN=" $8 ";-log10(q)_MAX=" $9 ";-log10(q)_MIN=" $10}' OmniATAC_q005_allpeaks.metrics.bed > OmniATAC_q005_allpeaks.pre.bed

cat "#gffTags\n" OmniATAC_q005_allpeaks.pre.bed > OmniATAC_q005_allpeaks.igv.bed

#Coordinates-only version of peaks used in bedtools multicov
awk '{print $1 "\t" $2 "\t" $3}' OmniATAC_q005_allpeaks.metrics.bed > OmniATAC_q005_coordinatesonly.bed

bedtools multicov -bams \
S13A_run1_q10.Genrich_sorted.samsort.bam \
S13B_run1_q10.Genrich_sorted.samsort.bam \
S14A_run1_q10.Genrich_sorted.samsort.bam \
S14B_run1_q10.Genrich_sorted.samsort.bam \
S15A_run1_q10.Genrich_sorted.samsort.bam \
S15B_run1_q10.Genrich_sorted.samsort.bam \
S17A_run1_q10.Genrich_sorted.samsort.bam \
S17B_run1_q10.Genrich_sorted.samsort.bam \
S18A_run1_q10.Genrich_sorted.samsort.bam \
S18B_run1_q10.Genrich_sorted.samsort.bam \
S19A_run1_q10.Genrich_sorted.samsort.bam \
S19B_run1_q10.Genrich_sorted.samsort.bam \
S19plusA_run1_q10.Genrich_sorted.samsort.bam \
S19plusB_run1_q10.Genrich_sorted.samsort.bam \
S20A_run1_q10.Genrich_sorted.samsort.bam \
S20B_run1_q10.Genrich_sorted.samsort.bam \
S21A_run1_q10.Genrich_sorted.samsort.bam \
S21B_run1_q10.Genrich_sorted.samsort.bam \
S22A_run1_q10.Genrich_sorted.samsort.bam \
S22B_run1_q10.Genrich_sorted.samsort.bam \
S23A_run1_q10.Genrich_sorted.samsort.bam \
S23B_run1_q10.Genrich_sorted.samsort.bam \
S24A_run1_q10.Genrich_sorted.samsort.bam \
S24B_run1_q10.Genrich_sorted.samsort.bam \
S25A_run1_q10.Genrich_sorted.samsort.bam \
S25B_run1_q10.Genrich_sorted.samsort.bam \
S26A_run1_q10.Genrich_sorted.samsort.bam \
S26B_run1_q10.Genrich_sorted.samsort.bam \
S27A_run1_q10.Genrich_sorted.samsort.bam \
S27B_run1_q10.Genrich_sorted.samsort.bam \
-bed OmniATAC_q005_coordinatesonly.bed > OmniATAC_q005_multicov.tsv

awk '{print $1"_"$2"_"$3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10 "\t" $11 "\t" $12 "\t" $13 "\t" $14 "\t" $15 "\t" $16 "\t" $17 "\t" $18 "\t" $19 "\t" $20 "\t" $21 "\t" $22 "\t" $23 "\t" $24 "\t" $25 "\t" $26 "\t" $27 "\t" $28 "\t" $29 "\t" $30 "\t" $31 "\t" $32 "\t" $33}' OmniATAC_q005_multicov.tsv > OmniATAC_q005_multicov_forDESeq.tsv