#!/bin/bash
# Job name:
#SBATCH --job-name=nano_stgtie
#
# Account:
#SBATCH --account=co_rosalind
#
# Partition:
#SBATCH --partition=savio3_xlmem
#
# Request one node:
#SBATCH --nodes=1
#
# Specify one task:
#SBATCH --ntasks-per-node=1
#
# Number of processors for single task needed for use case (example):
#SBATCH --cpus-per-task=32
#
# Mail type:
#SBATCH --mail-type=all
#
# Mail user:
#SBATCH --mail-user=dennis.a.sun@berkeley.edu
#
# Wall clock limit:
#SBATCH --time=10-00:00:00
#
# Requeues job upon preemption:
#SBATCH --requeue
#
## Command(s) to run:
module load python
module load samtools
module load cufflinks

stringtie -vo Par-haw_Nanopore_stringtie2_short.gtf Sall_RNA_sorted.bam
gffread Par-haw_Nanopore_stringtie2_short.gtf -g phaw_5.0.fa -w Par-haw_Nanopore_stringtie2_short.fasta