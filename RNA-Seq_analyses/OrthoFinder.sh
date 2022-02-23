#!/bin/bash
# Job name:
#SBATCH --job-name=OF
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
#SBATCH --time=10-00:00:00
#
# Requeues job upon preemption:
#SBATCH --requeue
#
## Command(s) to run:
module load python
module load transdecoder

TransDecoder.LongOrfs -t phaw_5.0.onlyGenes.exons.fasta && TransDecoder.Predict -t phaw_5.0.onlyGenes.exons.fasta
cp phaw_5.0.onlyGenes.exons.fasta.transdecoder.pep OrthoFinder_source/Parhyale2/
./OrthoFinder_source/orthofinder.py -f OrthoFinder_source/Parhyale2/