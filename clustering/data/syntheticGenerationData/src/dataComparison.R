# A file to set up the comparison vectors. 

# The variables to consider are as follows #
# "name","sex","age","date_of_death","governorate","location" #
# The values for these will be the same within any cluster.   #

 minidata <- dat[1:100,]
 unique.mini.id <- unique.id[1:100]

labeled.subset <- c("gender","given-name","surname","postcode","city","telephone-number","credit-card-number","income-normal","age-uniform","income","age","sex","blood-pressure")

# Step1: Allocate Memory for the Variables #
# Note: You must run this before you run anything else. #

# Gender Variables #
gender.j <- c()
# Name Variables #
first.name.j <- c()
last.name.j <- c()

# Postcode Variables #
postcode.j <- c()

# City Variables #
city.j <- c()

#Telephone Number Variables#
telephone-number.j <- c()

#Credit Card Number #
credit-card-number.j <- c()

#Income-Normal #
income-normal.j <- c()

# Age Uniform #
age-uniform

#Income #
income.j <- c()

#Age #
age.j <- c()

#Sex#
sex.j <- c()

#Blood Pressure #
blood.pressure.j <- c()

# Match variable - this is simply an indicator i.e. if the two clusters  #
# are the same then the variable will simply have a 1 here otherwise 0.  #
# in the notation of this dataset, this means that if the two variables  #
# have the same cid then this variable will be 1. Otherwise it will be 0 #
match <- c()
# We also need to define two entries to identify what rows of the dataset #
# are being used.                                                         #
index1 <- c()
index2 <- c()

c.id1 <- c()
c.id2 <- c()


# Step 2: Perform the score computations #

for(i in 1:nrow(final.data)){
	    # Select only the i-th row # 
        current.entry <- final.data[i,]
	    for(j in 1:nrow(final.data)){
        # Select the jth row to make the comparison against #
        current.comparison <- final.data[j,]
        # Identify the two indexing variables #
        index1 <- c(index1, rownames(current.entry)) 
        index2 <- c(index2, rownames(current.comparison))
        # Store the cluster id and the entity id as well #
        # Cluster #
        
        c.id1 <- c(c.id1, current.entry[,"unique.mini.id"]) 
        c.id2 <- c(c.id2, current.comparison[,"unique.mini.id"])
        # Entity #
        
      #  e.id1 <- c(e.id1, current.entry[,"id"])
       # e.id2 <- c(e.id2, current.comparison[,"id"])
       # # Compare against the j-th entry #
        
        # Name #
        # Compute the JARO-WINKLER similarity score #
        test.name.j <- stringsim(a = current.entry[,"name"], 
         b = current.comparison[,"name"], method = "jw")
        name.j <- c(name.j, test.name.j)
        # Compute the Exact similarity score #
        test.name.e <- ifelse(current.entry[,"name"] == 
         current.comparison[,"name"], 1, 0)
        name.e <- c(name.e, test.name.e)
        # Compute the SoundEx comparison #
        test.name.s <- stringsim(a = current.entry[,"name"], 
         b = current.comparison[,"name"], method = "soundex")
        name.s <- c(name.s, test.name.s)
       
        # Sex #
        test.sex.e <- ifelse(current.entry[,"sex"] == 
         current.comparison[,"sex"], 1, 0)
        sex.e <- c(sex.e, test.sex.e)
       
        # # Age #
        # test.age.e <- ifelse(current.entry[,"age"] == 
         # current.comparison[,"age"], 1, 0)
                # # Test whether the value is missing #
        		# if(is.na(test.age.e)){test.age.e <- 0}
        # age.e <- c(age.e, test.age.e)
         
        # # Date of Death #
        # test.date.d <- abs(as.numeric(as.Date(current.entry[,
             # "date_of_death"])-
               # as.Date(current.comparison[,"date_of_death"])))
        # date.of.death.d <- c(date.of.death.d, 
            # test.date.d)
         
        # # Governorate #
        # test.governorate.e <- ifelse(current.entry[,
         # "governorate"] == current.comparison[,"governorate"], 1, 0)
        # governorate.e <- c(governorate.e, test.governorate.e)
        
        # # Location #
        # test.location.e <- ifelse(current.entry[,
         # "location"] == current.comparison[,"location"], 1, 0)
        # location.e <- c(location.e, test.location.e)
        
        # Store the match results #
        test.match <- ifelse(current.entry[,"cid"] == 
         current.comparison[,"cid"], 1, 0)
        match <- c(match, test.match)
    }
}

# Store these in a data frame #
interim.output <- data.frame(cluster1 = c.id1, cluster2 = c.id2, 
 entity1 = e.id1, entity2 = e.id2, index1 = index1, index2 = index2, 
  name_j = name.j, name_e = name.e, name_s = name.s, sex_e = sex.e, 
   age_e = age.e, date_of_death_d = date.of.death.d, 
    governorate_e = governorate.e, location_e = location.e, Match = match)
    
# Write these to a usable .csv file #
write.csv(interim.output, row.names = FALSE, file = "trainDat.csv")
    

