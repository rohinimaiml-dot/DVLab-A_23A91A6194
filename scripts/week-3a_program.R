
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




































