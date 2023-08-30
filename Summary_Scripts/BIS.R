# BABS BIS Data Wrangling and Summary
# 8.10.23 JLC

#Import relevant packages
library(tidyverse)

# Import data (will update path to Shared Drive once data entry is complete)
BIS.path <- "~/Library/CloudStorage/Box-Box/BABS_Neuropsych/Data/BIS.csv"
BIS <-read.csv(BIS.path, header = T) %>% select(BABS_ID, starts_with("BIS")) %>%
  group_by(BABS_ID) %>% mutate_if(is.character, as.integer) %>% ungroup()
  
# Participant list (enter all participants that you would like to summarize here)
## This section can be commented out if you want to run all available participants
sub.IDs<- c("BABS005", "BABS006","BABS008", "BABS024", "BABS004", "BABS007", "BABS009", "BABS010", "BABS011", "BABS012",
            "BABS013", "BABS014", "BABS015", "BABS016", "BABS017", "BABS019", "BABS020", "BABS021", "BABS022", "BABS023",
            "BABS025","BABS026","BABS028","BABS029","BABS030","BABS031","BABS033","BABS035","BABS036","BABS037","BABS038",
            "BABS040", "BABS042", "BABS043", "BABS044", "BABS045", "BABS046", "BABS049", "BABS051", "BABS053", "BABS055",
            "BABS056", "BABS057", "BABS058", "BABS059", "BABS060", "BABS061", "BABS062", "BABS066", "BABS067", "BABS069",
            "BABS070", "BABS071", "BABS072", "BABS073", "BABS074", "BABS075", "BABS076", "BABS077", "BABS079", "BABS080",
            "BABS081", "BABS082", "BABS083", "BABS084", "BABS085", "BABS086", "BABS087", "BABS088", "BABS089", "BABS090",
            "BABS091", "BABS092", "BABS093", "BABS094", "BABS095", "BABS096", "BABS097", "BABS098", "BABS099", "BABS100",
            "BABS101", "BABS102", "BABS104", "BABS105", "BABS106", "BABS107", "BABS108", "BABS110", "BABS111", "BABS112",
            "BABS113", "BABS114", "BABS115", "BABS116", "BABS117", "BABS118", "BABS119", "BABS121", "BABS122", "BABS124",
            "BABS125", "BABS126", "BABS128", "BABS129", "BABS130", "BABS131", "BABS132", "BABS133", "BABS134", "BABS135",
            "BABS136", "BABS138", "BABS139", "BABS141", "BABS142", "BABS143", "BABS145", "BABS146", "BABS147", "BABS148",
            "BABS150", "BABS151", "BABS152", "BABS154", "BABS155", "BABS157","BABS158", "BABS159", "BABS160", "BABS161",
            "BABS162", "BABS163", "BABS166", "BABS168", "BABS169", "BABS170", "BABS171", "BABS172", "BABS173", "BABS174",
            "BABS175", "BABS176", "BABS177", "BABS179", "BABS180", "BABS181", "BABS196", "BABS266", "BABS272", "BABS279",
            "BABS284")

#Creating clean data frame for summary
BIS.clean <- BIS %>% pivot_longer(names_to = "facet", values_to = "response", -c(BABS_ID, BIS_Session)) %>%
  separate_wider_delim(facet,"__", names = c("Scale", "Subscale")) %>%
  separate_wider_delim(Scale,"_", names = c(NA, "Scale"))
  
