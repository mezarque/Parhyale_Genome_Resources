#!/bin/bash
# Job name:
#SBATCH --job-name=DAS_stringtie
#
# Account:
#SBATCH --account=co_rosalind
#
# Partition:
#SBATCH --partition=savio
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
## Command(s) to run:
module load busco
module load blast
module load augustus

python $BUSCO_DIR/scripts/run_BUSCO.py -i Par-haw_Nanopore_stringtie2_mix.fasta -o Par-haw_Nanopore_stringtie2_mix.busco -l arthropoda_odb9 -m tran