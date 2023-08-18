df=read.csv('/Users/amrit/Downloads/COVID-19 Cases.csv')
df

#preprocessing-data
#dropping col. having null values
df <- df[,colSums(is.na(df))<nrow(df)]

#converting char date to date f
ormat
df$Date<-as.Date(df$Date, format = "%m/%d/%Y")
df$Date


##calculating total confirmed cases
md<-subset(df,select = c(Case_Type,Cases))
md<-md[md$Case_Type=='Confirmed',]
sum(md$Cases)

##calculating total confirmed deaths
md<-subset(df,select = c(Case_Type,Cases))
md<-md[md$Case_Type=='Deaths',]
sum(md$Cases)

#Creating Table1
dataframe1<-subset(df,select = c(Case_Type,Cases,Country_Region))
dataframe1

#Calculating top10 countries with confirmed cases
dataframe1<-dataframe1[dataframe1$Case_Type=='Confirmed',]
dataframe1
a<-aggregate(dataframe1$Cases,list(dataframe1$Country_Region),FUN=sum)
b<-head(a[order(a$x, decreasing = TRUE),], 10)
xi<-as.integer((b$x))
barplot(xi,names.arg = c(b$Group.1) )

options(scipen = 999)

#Creating Table2
dataframe2<-subset(df,select = c(Case_Type,Cases,Country_Region))
dataframe2

#Calculating top10 countries with confirmed deaths
dataframe2<-dataframe2[dataframe2$Case_Type=='Deaths',]
dataframe2
a<-aggregate(dataframe2$Cases,list(dataframe2$Country_Region),FUN=sum)
b<-head(a[order(a$x, decreasing = TRUE),], 10)
barplot(b$x,names.arg = c(b$Group.1) )


