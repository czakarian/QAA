#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=0-04:00:00

# input files
file1="/projects/bgmp/shared/2017_sequencing/demultiplexed/10_2G_both_S8_L008_R1_001.fastq.gz"
file2="/projects/bgmp/shared/2017_sequencing/demultiplexed/10_2G_both_S8_L008_R2_001.fastq.gz"
file3="/projects/bgmp/shared/2017_sequencing/demultiplexed/31_4F_fox_S22_L008_R1_001.fastq.gz"
file4="/projects/bgmp/shared/2017_sequencing/demultiplexed/31_4F_fox_S22_L008_R2_001.fastq.gz"

# output files
o1="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/10_2G_both_S8_L008_R1_001_AT.fastq.gz"
o2="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/10_2G_both_S8_L008_R2_001_AT.fastq.gz"
o3="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/31_4F_fox_S22_L008_R1_001_AT.fastq.gz"
o4="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/31_4F_fox_S22_L008_R2_001_AT.fastq.gz"

conda activate QAA

r1_adaptor="AGATCGGAAGAGCACACGTCTGAACTCCAGTCA"
r2_adaptor="AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT"

# /usr/bin/time -v cutadapt $file1 -a $r1_adaptor -o $o1 
# /usr/bin/time -v cutadapt $file2 -a $r2_adaptor -o $o2 
# /usr/bin/time -v cutadapt $file3 -a $r1_adaptor -o $o3
# /usr/bin/time -v cutadapt $file4 -a $r2_adaptor -o $o4

/usr/bin/time -v cutadapt -j 4 $file1 $file2 -a $r1_adaptor -A $r2_adaptor -o $o1 -p $o2

/usr/bin/time -v cutadapt -j 4 $file3 $file4 -a $r1_adaptor -A $r2_adaptor -o $o3 -p $o4
