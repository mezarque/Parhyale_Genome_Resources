#!/bin/bash
# Job name:
#SBATCH --job-name=HB_BUSCO
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

python $BUSCO_DIR/scripts/run_BUSCO.py -i Trinity_S13.fasta -o Trinity_S13.busco -l arthropoda_odb9 -m tran
python $BUSCO_DIR/scripts/run_BUSCO.py -i Trinity_S19.fasta -o Trinity_S19.busco -l arthropoda_odb9 -m tran
python $BUSCO_DIR/scripts/run_BUSCO.py -i Trinity_S21.fasta -o Trinity_S21.busco -l arthropoda_odb9 -m tran
python $BUSCO_DIR/scripts/run_BUSCO.py -i Trinity_S23.fasta -o Trinity_S23.busco -l arthropoda_odb9 -m tran