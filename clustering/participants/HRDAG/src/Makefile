# Authors:     PB
# Maintainers: PB
# Copyright:   2016, HRDAG, GPL v2 or later
# ============================================
# DLAW02/clustering/participants/HRDAG/src/Makefile
# placeholder for clustering experiment

.PHONY: all

all: output/labels.csv

output/labels.csv: \
		input/data.csv.gz \
		src/cluster.py
	python3 $< \
		--input=input/data.csv.gz \
		--output=$@
