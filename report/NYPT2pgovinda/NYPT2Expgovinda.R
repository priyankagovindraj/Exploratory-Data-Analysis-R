temp = list.files(pattern = "*.csv")
myFiles = lapply(temp, read.delim)

datatest1 <- do.call(rbind, lapply(temp, read.csv))
datatest1$Gendercat <- cut(datatest1$Gender,c(-Inf,0,Inf))
datatest1$Signedincat <- cut(datatest1$Signed_In,c(-Inf,0,Inf))
datatest1$impscat <- cut(datatest1$Impressions,c(-Inf,0,5,10,15,20,Inf))
datatest1$agecat <- cut(datatest1$Age,c(-Inf,0,18,24,34,44,54,64,Inf))
datatest1$clickscat <- cut(datatest1$Clicks,c(-Inf,0,3,Inf))
#library(doBy)
#siterange <- function(x){c(length(x),min(x),mean(x),max(x))}
#summaryBy(Age~agecat, data=datatest1, FUN = siterange)
#summaryBy(Gender+Signed_In+Impressions+Clicks~agecat, data = datatest1)
#library(ggplot2)
ggplot(datatest1,aes(x=Impressions, fill=Signedincat))+geom_histogram(binwidth=0.5)
ggplot(datatest1,aes(x=Clicks, fill=Signedincat))+geom_histogram(binwidth=0.5)
ggplot(datatest1,aes(x=Age, fill=Signedincat))+geom_histogram(binwidth=0.5)
#ggplot(datatest1,aes(x=Impressions, fill=Signedincat))+geom_histogram(binwidth=0.5)
#ggplot(datatest1,aes(x=Signed_In, fill=impscat))+geom_histogram(binwidth=0.5)


#ggplot(datatest1,aes(x=Gender, fill=impscat))+geom_histogram(binwidth=0.5)
#ggplot(datatest1,aes(x=Gender, fill=clickscat))+geom_histogram(binwidth=1)
#ggplot(datatest1,aes(x=Gender, fill=clickscat))+geom_histogram(binwidth=0.5)
#ggplot(datatest1,aes(x=Gender))+geom_bar()
ggplot(datatest1,aes(x=agecat, y=Impressions,fill=impscat))+geom_boxplot()


#ggplot(datatest1,aes(x=Age, fill=impscat))+geom_histogram(binwidth = 0.5)
#ggplot(datatest1,aes(x=Age, fill=impscat))+geom_histogram(binwidth = 1)
#ggplot(datatest1,aes(x=Age, fill=agecat))+geom_histogram(binwidth = 1)
ggplot(datatest1,aes(x=Impressions, fill=agecat))+geom_histogram(binwidth = 0.5)
ggplot(datatest1,aes(x=Impressions, fill=clickscat))+geom_histogram(binwidth = 0.5)
ggplot(datatest1,aes(x=Impressions, fill=Gendercat))+geom_histogram(binwidth = 0.5)

#ggplot(datatest1,aes(x=Impressions, fill=Gendercat))+geom_bar()

#ggplot(datatest1,aes(x=Signedincat, y=Age,fill=Gendercat))+geom_boxplot()
#ggplot(datatest1,aes(x=Signedincat, y=Impressions,fill=Gendercat))+geom_boxplot()
#ggplot(datatest1,aes(x=agecat, y=Impressions,fill=Gendercat))+geom_boxplot()
#ggplot(subset(datatest1,Signed_In>0),aes(x=agecat, colour=impscat))+geom_density()
#ggplot(subset(datatest1,Signed_In>0),aes(x=agecat, colour=Gendercat))+geom_density()

ggplot(subset(datatest1,Gender>0),aes(x=agecat, colour=impscat))+geom_density()