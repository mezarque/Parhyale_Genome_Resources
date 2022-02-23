#!/bin/bash
# Job name:
#SBATCH --job-name=NucATall
#
# Account:
#SBATCH --account=co_rosalind
#
# QoS: must be savio_long for jobs over 3 days
#SBATCH --qos=savio_long
#
# Partition:
#SBATCH --partition=savio2_htc
#
# Number of tasks needed for use case (example):
#SBATCH --ntasks=1
#
# Processors per task:
#SBATCH --cpus-per-task=12
#
# Wall clock limit (7 days in this case):
#SBATCH --time=10-00:00:00
#
# Mail type:
#SBATCH --mail-type=all
#
# Mail user:
#SBATCH --mail-user=dennis.a.sun@berkeley.edu
#
# Requeues job upon preemption:
#SBATCH --requeue
#
## Command(s) to run (example):
module load python/2.7
module load samtools

echo '### running allstages analysis'
nucleoatac nfr --bed OmniATAC_bothruns_q005_coordinatesonly.bed --occ_track S20AB_nucleoatac.occ.bedgraph.gz --calls S20AB_nucleoatac.nucpos.bed.gz --bam S20AB_bothruns_q10.Genrich_resorted.bam --fasta phaw_5.0.fa --out S20AB_nucleoatac --cores 12 2>&1