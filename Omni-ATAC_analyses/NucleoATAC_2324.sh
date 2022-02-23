#!/bin/bash
# Job name:
#SBATCH --job-name=NucATAC2
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
module load python/2.7
module load samtools

echo '### running S23AB analysis'
nucleoatac run --bed OmniATAC_bothruns_q005_coordinatesonly.bed --bam S23AB_bothruns_q10.Genrich_resorted.bam --fasta phaw_5.0.fa --out S23AB_nucleoatac --cores 12 2>&1

echo '### running S24AB analysis'
nucleoatac run --bed OmniATAC_bothruns_q005_coordinatesonly.bed --bam S24AB_bothruns_q10.Genrich_resorted.bam --fasta phaw_5.0.fa --out S24AB_nucleoatac --cores 12 2>&1