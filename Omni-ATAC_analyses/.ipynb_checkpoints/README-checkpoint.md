# Omni-ATAC_analyses

Descriptions of the function of each of the files in this directory.

#### Omni-ATAC_all-analysis_2021.ipynb
Jupyter notebook containing scripts for trimming reads, aligning to genome using bowtie2, and calling peaks using Genrich. </br>
__Output:__ .bam files for reads, .bedGraph files for aligned reads, Genrich stage-specific .narrowPeak files

#### Omni-bedtools-merge_q005.sh
SLURM script for merging Genrich .narrowPeak files into merged peaks for bedtools multicov analysis. </br>
__Output:__ merged peak file, multicov file (accessibility at each peak over time) for DESeq2/ImpulseDE2 analyses

#### Omni-dptls-mikado.sh
SLURM script using deeptools to generate genome-wide average enrichment signal for Mikado annotations. </br>
__Output:__ .pdf, .gz deeptools files

#### Omni-dptls.sh
SLURM script using deeptools to generate genome-wide average enrichment signal for the phaw_5.0 MAKER annotation. </br>
__Output:__ .pdf, .gz deeptools files

#### Omni-merge-and-dptls.sh
SLURM script using deeptools to generate genome-wide average enrichment signal for Mikado annotations. </br>
__Output:__ .pdf, .gz deeptools files

#### OmniATAC_multilevel_scripts.ipynb
This Jupyter notebook does a lot of things, including:</br>
- Finding the location of a given Parhyale gene in the Parhyale genome and providing an IGV address
- Extracting .fasta sequence of a given IGV region from the Parhyale genome
- Extracting the .fasta sequence for all ATAC-Seq peaks overlapping a given IGV region in the Parhyale genome
- Finding the location of the Hyalella genomic region most similar to a Parhyale gene
- Extracting .fasta sequence of a given IGV region from the Hyalella genome
- Converting VISTA homology files into IGV-readable .gff files
- Merging all VISTA homology .gff files into a single file for easy IGV viewing
- Miscellaneous scripts for making MEME and FIMO visualization in IGV easier