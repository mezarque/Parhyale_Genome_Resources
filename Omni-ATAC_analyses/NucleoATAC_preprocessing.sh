#!/bin/bash
# Job name:
#SBATCH --job-name=NucATAC2
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
## Command(s) to run:
module load python/2.7
module load samtools

for a in S*A_bothruns_q10.Genrich_resorted.bam ; do \
        b=`echo $a | sed 's/A_bothruns/B_bothruns/'`
        ab=`echo $a | sed 's/A_bothruns/AB_bothruns/'`
        echo '### merging '$a' and '$b' and outputting to '$ab
        samtools merge $ab $a $b 2>&1
done

echo '### Merging all files into OmniATAC_bothruns_allstages_merged.bam'
samtools merge OmniATAC_bothruns_allstages_merged.bam *AB_bothruns_q10.Genrich_resorted.bam
