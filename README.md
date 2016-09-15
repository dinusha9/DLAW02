# DLAW02
blocking and clustering: plans, proposals, papers, data, code, results

This repository includes work by the blocking and clustering group from the [Data Linkage: Techniques, Challenges and Applications (02) workshop](https://www.newton.ac.uk/event/dlaw02/timetable) at the Isaac Newton Institute for the Mathematical Sciences, 12-16 September 2016.

Here is a list of relevant directories:
```
blocking/ top level for blocking
    papers/  papers relevant to blocking
	needs/  documents (LaTeX, markdown, docx) describing participants' needs for blocking approaches
	reccs/  working area for recommendations

clustering/  top level for clustering
    papers/ papers relevant to clustering
	data/  the data for the clustering experiment
	participants/ create a subdirectory for your experiment here.
```

I've created an empty project in `DLAW02/clustering/particpants/HRDAG` that gives a sense of how HRDAG structures data projects. More details are available in [this blog post](https://hrdag.org/2016/06/14/the-task-is-a-quantum-of-workflow/).

In particular, it would be useful if in your participant directory, you included a subdirectory called `output/` in which you report a file mapping record identifiers to cluster labels (perhaps called `output/labels.csv`). This will facilitate us grouping the results.
