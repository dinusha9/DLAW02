This branch contains Dinusha's synthetic data. The report is:

```
I've sampled a dataset of 100K records containing true matching clusters of size 1 to 10 with the following distribution:

Size 1 = 63055
Size 2 = 32543
Size 3 = 3673
Size 4 = 479
Size 5 = 94
Size 6 = 36
Size 7 = 47
Size 8 = 37
Size 9 = 16
Size 10 = 20

I've then generated the pair-wise weights (similarities) and output in a .csv file.
The format is:
recID_sourceID, recID_sourceID, similarity
where if recIDs are the same then it's a true match.

```
