#!/bin/bash
# Job name:
#SBATCH --job-name=mik_t
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
module load java
module load transdecoder

ipython Mikado_transdecoder.py