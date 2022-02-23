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

echo '### running S13AB analysis'
nucleoatac run --bed OmniATAC_bothruns_q005_coordinatesonly.bed --bam S13AB_bothruns_q10.Genrich_resorted.bam --fasta phaw_5.0.fa --out S13AB_nucleoatac --cores 12 2>&1

echo '### running S14AB analysis'
nucleoatac run --bed OmniATAC_bothruns_q005_coordinatesonly.bed --bam S14AB_bothruns_q10.Genrich_resorted.bam --fasta phaw_5.0.fa --out S14AB_nucleoatac --cores 12 2>&1