require(gdata)
mh<-read.xls("rollingsales_manhattan.xls",pattern = "BOROUGH")
head(mh)
summary(mh)
mh$SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]","",mh$SALE.PRICE))
names(mh) <- tolower(names(mh))
mh$gross.sqft <- as.numeric(gsub("[^[:digit:]]","",mh$gross.square.feet))
mh$land.sqft <- as.numeric(gsub("[^[:digit:]]","",mh$land.square.feet))
mh$sale.date <- as.Date(mh$sale.date)
mh$year.built <- as.numeric(as.character(mh$year.built))
attach(mh)
hist(sale.price.n)
hist(sale.price.n[sale.price.n>0])
hist(gross.sqft[sale.price.n==0])
detach(mh)
mh.sale <- mh[mh$sale.price.n!=0,]
plot(mh.sale$gross.sqft,mh.sale$sale.price.n)
plot(log(mh.sale$gross.sqft),log(mh.sale$sale.price.n))
mh.apartments <- mh.sale[which(grepl("ELEVATOR",mh.sale$building.class.category)),]
plot(mh.apartments$gross.sqft,mh.apartments$sale.price.n)
plot(log(mh.apartments$gross.sqft),log(mh.apartments$sale.price.n))
mh.apartments[which(mh.apartments$sale.price.n<100000),] [order(mh.apartments[which(mh.apartments$sale.price.n<100000),]$sale.price.n),]
mh.apartments$outliers <- (log(mh.apartments$sale.price.n) <=5) +0
mh.apartments <- mh.apartments[which(mh.apartments$outliers==0),]
plot(log(mh.apartments$gross.sqft),log(mh.apartments$sale.price.n))

mh.commercial <- mh.sale[which(grepl("COMMERCIAL",mh.sale$building.class.category)),]
plot(mh.commercial$gross.sqft,mh.commercial$sale.price.n)

mh.walkup <- mh.sale[which(grepl("WALKUP",mh.sale$building.class.category)),]
plot(mh.walkup$gross.sqft,mh.walkup$sale.price.n)
plot(log(mh.walkup$gross.sqft),log(mh.walkup$sale.price.n))
mh.walkup$outliers <- (log(mh.walkup$sale.price.n) <=5) +0
mh.walkup <- mh.walkup[which(mh.walkup$outliers==0),]
plot(log(mh.walkup$gross.sqft),log(mh.walkup$sale.price.n))