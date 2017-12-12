# Read in data from tab delimited results.dat file
mydata <- read.table("C:/Users/jadom_000/Desktop/Enterprise Performance Architecture/results.dat", sep = "\t", header = TRUE)

# Create new values based on performance laws
utilisation <- (100 - mydata$idle)
serviceDemand <- ((utilisation / 100) * 5) / mydata$C0
throughput <- (mydata$C0 / 5)
avgResponseTime <- (mydata$N / throughput) 

# Plot each graph with relevant titles and labels
plot(mydata$N, utilisation, xlab= "Number of Users", ylab = "Utilisation %", main = "Utilisation vs Number of Users", type="o")
plot(mydata$N, serviceDemand, xlab= "Number of Users", ylab = "Service Demand (secs per transaction)", main = "Service Demand vs Number of Users", type="o")
plot(mydata$N, throughput, xlab= "Number of Users", ylab = "Throughput (tps)", main = "Throughput  vs Number of Users", type = "o")
plot(mydata$N, avgResponseTime, xlab= "Number of Users", ylab = "Average Response Time (seconds)", main = "Average Response Time vs Number of Users", type = "o")