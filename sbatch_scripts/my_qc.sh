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

# quality score plotting script from demultiplexing part 1
script="/projects/bgmp/czakari2/bioinformatics/Bi622/Demultiplex/Assignment-the-first/qs_dist.py"

# output directory
d="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/my_QC_output/"

# output plot file names 
p1="10_2G_both_S8_L008_R1.png"
p2="10_2G_both_S8_L008_R2.png"
p3="31_4F_fox_S22_L008_R1.png"
p4="31_4F_fox_S22_L008_R2.png"

conda activate bgmp_py39

# mkdir $d

/usr/bin/time -v $script -f $file3 -p $d$p3
/usr/bin/time -v $script -f $file4 -p $d$p4
/usr/bin/time -v $script -f $file1 -p $d$p1 
/usr/bin/time -v $script -f $file2 -p $d$p2
