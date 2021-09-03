#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00

# input sam files
f1="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/star_10_2G/10_2G_Aligned.out.sam"

# gtf file
g1="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/Mus_musculus.GRCm39.104.gtf"

conda activate QAA

/usr/bin/time -v htseq-count $f1 $g1 --stranded=yes > ../htseq_output/10_2G_stranded.genecount

/usr/bin/time -v htseq-count $f1 $g1 --stranded=no > ../htseq_output/10_2G_unstranded.genecount