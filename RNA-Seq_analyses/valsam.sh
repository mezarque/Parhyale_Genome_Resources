#!/bin/bash
# Job name:
#SBATCH --job-name=valsam
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
module load java
module load picardtools

#java -jar /clusterfs/vector/home/groups/software/sl-7.x86_64/modules/picard/2.9.0/lib/picard.jar ValidateSamFile I=Sall_RNA_sorted.aligned.bam MODE=SUMMARY
java -jar /clusterfs/vector/home/groups/software/sl-7.x86_64/modules/picard/2.9.0/lib/picard.jar CleanSam I=Sall_RNA_sorted.aligned.bam O=Sall_RNA_sorted.cleaned.bam