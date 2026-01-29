# Load Air Passengers Dataset
data(AirPassengers)


#Verifying Dataset
?AirPassengers
class(AirPassengers)
View(AirPassengers)


#Converting the dataset to Dataframe
ap_df <- data.frame(
  year <- time(AirPassengers),
  passengers=as.numeric(AirPassengers)
)
ap_df


#Data Frame with years & months Separately
ap_df_months <- data.frame(
  year= floor(time(AirPassengers)),
  month=cycle(time(AirPassengers)),
  passengers=as.numeric(AirPassengers)
)
ap_df_months

#Basic plotting
plot(AirPassengers)

#Plot with Title, Axislabels and Color
plot(AirPassengers,
     type='l',
     main="Air Passengers Trend Analysis",
     xlab="Months",
     ylab="No.of Passengers",
     col="red"
)
#changing the line width &point
plot(AirPassengers,
     type='o',
     pch=16,
     col="blue")
grid()


# Using GGPLOT2 Library
#Importing the library ggplot2
library(ggplot2)

# A Basic Grid with x,y axes
ggplot(ap_df,
       aes(x=year,y=passengers))+
  geom_line(color='darkgreen',linewidth=0.5)+
  labs(
    title='Trend Analysis of Air Passengers',
    subtitle='From 1949-1960',
    caption='Uisng built-in Air Passengers Dataset',
    x='Months',
    y='No.of Passengers')+
  geom_point(color='red',size=0.5)+
  geom_smooth(se=FALSE,color='orange')+
  theme_minimal()+
  theme(
    plot.title=element_text(face="bold",size=14),
    plot.subtitle=element_text(size=10))


# Load the Dataset
data(iris)

#Inspect the Data
?iris
head(iris,3)
str(iris)
class(iris)



#very Basic Bar chart
#COunt of each Species
#TO see the data in the column "Species"
iris$Species
View(iris)

#Plot iris #Plotting a Bar chart
barplot(
  table(iris$Species)
)

#Labled Bar chart
barplot(
  table(iris$Species),
  main="Count of iris species",
  xlab="Species",
  ylab="Number of Items",
  col='steelblue'
)

#Add title, axislabels, and color
#Bar chart from Aggregated data
#Using mean Sepal length per Species
mean_sepal <- tapply(iris$Sepal.Length,iris$Species,mean)
mean_sepal

barplot(
  mean_sepal,
  col='orange',
  main="Average sepal length by species",
  xlab="Species",
  ylab="Mean Sepal Length"
)

#Grouped Bar chart
#Compare Sepal & Petal Length(mean)
group_means <-rbind(
  Sepal=tapply(iris$Sepal.Length,iris$Species,mean),
  Petal=tapply(iris$Petal.Length,iris$Species,mean)
)
group_means

#Grouped (Clustered) bar chart
barplot(
  group_means,
  beside=TRUE,
  col=c("skyblue","pink"),
  legend.text=TRUE,
  main="Clustered Bar chart: Sepal vs Petal Length"
)

# Grouped (Stacked) bar chart
barplot(
  group_means,
  beside=FALSE,
  col=c("skyblue","pink"),
  legend.text=TRUE,
  main="Stacked Bar chart: Sepal vs Petal Length"
)








































