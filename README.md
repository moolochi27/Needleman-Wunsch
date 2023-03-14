# Needleman-Wunsch
code challenge given by BMEG 310 professor

Basic implementation of Needleman_Wunsh Algorithm.

Currently, scoring matrix is read from a csv file, and the two sequences are string inputs in main.R
The output is two char arrays New.Seq.A and New.Seq.B of equal size, where New.Seq.A[i] is matched with New.Seq.B[i] in the optimal sequence. a "-" denotes a gap.

This code will fail if there exist no similarities between the two sequences.

May change later to be optimized for larger datasets by only generating matrix values within k distance from the diagonal.

Might add some basic machine learning to find an optimal "kstart" and "kmax" 


March 14, 2023 (Pi day!)- Totally did not completely forget that this existed.
