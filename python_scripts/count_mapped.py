#!/usr/bin/env python

"""This program parses the contents of a SAM file and counts the #reads 
that were either mapped or not mapped to the reference genome."""

import argparse

def get_args():
    """This function returns the parser arguments entered in command line"""
    parser = argparse.ArgumentParser(description="A program to count mapped/unmapped reads in SAM file")
    parser.add_argument("-f", "--file", help="Input filename", required=True)
    #parser.add_argument("-o", "--ofile", help="Output filename", required=True)
    return parser.parse_args()

# store the command line args in variables
args = get_args()
file= args.file
#ofile = args.ofile

# to store counts of mapped and unmapped reads
mapped = 0
unmapped = 0

with open(file, "r") as fr:
    for line in fr:
        # skip the header lines in SAM file
        if line[0:1] != "@":
            cols = line.strip().split('\t')
            flag = cols[1]
            # if not a secondary alignment, increment either mapped or unmapped counter
            if((int(flag) & 256) != 256):
                if((int(flag) & 4) != 4):
                    mapped += 1
                else:
                    unmapped += 1      

# with open(ofile, "w") as fw:
#    fw.write("Number of mapped reads: " + str(mapped) + "\n")
#    fw.write("Number of unmapped reads: " + str(unmapped))

print("Mapped:", mapped)
print("Unmapped:", unmapped)
