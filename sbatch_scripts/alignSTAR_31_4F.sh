#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00

# input fastq files
r1="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/31_4F_fox_S22_L008_R1_001_AT_Trk.fastq.gz"
r2="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/31_4F_fox_S22_L008_R2_001_AT_Trk.fastq.gz"

# reference genome directory 
d1="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/Mus_musculus.GRCm39.dna.ens104.STAR_2.7.9a"

# output directory + prefix
o1="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/star_31_4F/31_4F_"

conda activate QAA

/usr/bin/time -v STAR \
--runThreadN 8 \
--runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 \
--alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn $r1 $r2 \
--genomeDir $d1 \
--outFileNamePrefix $o1