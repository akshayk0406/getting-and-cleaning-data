getting-and-cleaning-data
=========================
This file describes how run_analysis.R works.

- First make the sure that , the script and run_analysis.R and the data extracted from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" is in same directory

- To execute the script , open R console and run the command source("run_analysis.R")

- After executing the above command, two files will be created one with name "final_data.txt" and other with the name "new_final_data.txt" with size of approximately 7.9 MB and 219.5 KB respectively. "final_data.txt" contains a data-frame with dimensions of 10299*68 and"new_final_data.txt" contains a data-frame with dimensions of 180*68.This can verified by running data<- read.table("new_final_data.txt")  in R console.

-   

 
