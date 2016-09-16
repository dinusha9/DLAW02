#!/usr/bin/python
# Authors:     PB
# Maintainers: PB
# Copyright:   2016, HRDAG, GPL v2 or later
# ============================================
# DLAW02/clustering/data/beka-dataGeneration/syntheticGenerationData/src/add-ids.py
'''
   adds id column as first in starting dataset
   id is required for Anshu's blocking code
'''

import pandas as pd

input_path = "output/englishSyntheticData1250.csv"
output_path = "output/englishSyntheticData1250-i.csv"
esd = pd.read_csv(input_path)
print(esd.info())

esd['id'] = esd.index

cols = ['id']  + [col for col in esd if col != 'id']
esd = esd[cols]

esd.to_csv(output_path, sep="|", index=False)

print("done.")
