# Synthetic data generation README

This is a synthetically generated file created from ANU Online Personal Data Generator and Corruptor (GeCo) (https://dmm.anu.edu.au/geco/), by Khoi-Nguyen Tran, Dinusha Vatsalan, and Peter Christen. 

The synthetic dataset generate-data-english-syntheticData.py creates englishSyntheticData1250.csv which contains 

- 1250 records with a maximum cluster size of 10
- The empirical distribution of the data set can be seen
easily below as well as how to read in the data set. 

## Read in the data
```{r}
dat <- read.csv("~/work_on/geco-data-generator-corruptor/englishSyntheticData1250.csv", header=TRUE)
```

## Format the data and look at the data structure
```{r}
head(dat)
dat$rec.id <- gsub("^rec-", "", dat$rec.id)
dat$rec.id <- as.numeric( gsub("-[[:alnum:]]+", "", dat$rec.id) )
dat$rec.id <- dat$rec.id + 1
unique.id <- dat$rec.id 
dat  <- dat[,-1]
```

## The empirical distribution of the data
```{r}
y <- log((table(table(unique.id))))
barplot(y, xlab = "cluster size", ylab="number of unique records")
plot("empiricalDistribution")
```

