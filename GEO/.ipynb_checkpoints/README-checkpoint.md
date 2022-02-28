# GEO Files

This file describes all of the files found in the Gene Expression Omnibus (GEO) submissions associated with the Sun et al. 2022 manuscript.

## directory `q005_narrowpeak/`
#### `.narrowPeak` files
Genrich stage-specific peaks in [ENCODE .narrowPeak format](https://genome.ucsc.edu/FAQ/FAQformat.html#format12).
Data includes p-value for each peak and q-value merged across replicates by Genrich.

#### `.narrowPeak.gff` files
Genrich stage-specific peaks converted to [GFF format](https://genome.ucsc.edu/FAQ/FAQformat.html#format3) for viewing in IGV.


## directory `match_specific_9acoresplit/`
#### `acore#_mbps.bed` files
Motif binding site predictions collected across all stages for peaks overlapping with a given acore.

___NOTE:___ Each "acore" assigned by Mfuzz is NOT identical to each Cluster referred to in the manuscript. The following table explains the relationship between each "acore" in these files and the final Clusters in the paper:

| acore number | Cluster number |
|-------------:|:---------------|
| acore6 | Cluster 1 |
| acore9 | Cluster 2 |
| acore5 | Cluster 3 |
| acore8 | Cluster 4 |
| acore3 | Cluster 5 |
| acore7 | Cluster 6 |
| acore2 | Cluster 7 |
| acore1 | Cluster 8 |
| acore4 | Cluster 9 |