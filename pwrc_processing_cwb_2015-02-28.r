# get working director

getwd()

# Import datasets

cwb <- read.csv("~/R/pwrc-cwb/bison_CWB_final_2015_02_13.csv")

specieslu <- read.delim("~/R/pwrc-cwb/cwb_species_lu.txt")






# view column names

colnames(cwb)



## create data columns for BISON ingest by running external R script

source("Create_BISON_DataFrame_43F.R") 

# use rbind to order data columns - bsn43f is master order

cwb_temp <- rbind(bsn43f,cwb)

cwb_temp <- cwb_temp[-1,] # remove first row

row.names(cwb_temp)<-NULL # remove row.names column

# review scientific names and clean

uspecies_cwb<-unique(cwb_temp$clean_provided_scientific_name)



# subset for review

uspecies_cwb<-unique(cwb_temp$clean_provided_scientific_name)
write.table(uspecies_cwb, file = "bison_cwb_uspecies_2015-02-28.txt", append = FALSE, quote = FALSE, sep= "\t", eol = "\n", na = "", dec = ".", row.names = FALSE, col.names = TRUE)
rm(uspecies_cwb)

cwb_top50<-head(cwb_temp)
write.table(cwb_top50, file = "bison_cwb_top50_2015-02-28.txt", append = FALSE, quote = FALSE, sep= "\t", eol = "\n", na = "", dec = ".", row.names = FALSE, col.names = TRUE)
rm(cwb_top50)

cwb_bottom50<-tail(cwb_temp)
write.table(cwb_bottom50, file = "bison_cwb_bottom_50_2015-02-28.txt", append = FALSE, quote = FALSE, sep= "\t", eol = "\n", na = "", dec = ".", row.names = FALSE, col.names = TRUE)
rm(cwb_bottom50)

cwb_subset100000<-cwb_temp[1:100000,]
write.table(cwb_subset100000, file = "bison_cwb_100k_2015-02-28.txt", append = FALSE, quote = FALSE, sep= "\t", eol = "\n", na = "", dec = ".", row.names = FALSE, col.names = TRUE)
rm(cwb_subset100000)

# write out final bbl data

write.table(cwb_temp, file = "bison_cwb_ordered_final_2015-02-28.txt", append = FALSE, quote = FALSE, sep= "\t", eol = "\n", na = "", dec = ".", row.names = FALSE, col.names = TRUE)



