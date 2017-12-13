# Read in data from tab delimited results.dat file
mydata <-
  read.table(
    "H:/Desktop/Enterprise Performance Architecture/results.dat",
    sep = "\t",
    header = TRUE
  )

# Create new values based on performance laws

# Subtract idle time % from 100 to get Ui as a percentage
utilisation <- (100 - mydata$idle)

# Divide Ui by 100 to get percentage value
serviceDemand <- ((utilisation / 100) * 5) / mydata$C0
throughput <- (mydata$C0 / 5)
avgResponseTime <- (mydata$N / throughput)

# Plot each graph with relevant titles and labels
plot(
  mydata$N,
  utilisation,
  xlab = "Number of Users",
  ylab = "Utilisation %",
  main = "Utilisation vs Number of Users",
  type = "o"
)
plot(
  mydata$N,
  serviceDemand,
  xlab = "Number of Users",
  ylab = "Service Demand (seconds per request)",
  main = "Service Demand vs Number of Users",
  type = "o"
)
plot(
  mydata$N,
  throughput,
  xlab = "Number of Users",
  ylab = "Throughput (requests per second)",
  main = "Throughput vs Number of Users",
  type = "o"
)
plot(
  mydata$N,
  avgResponseTime,
  xlab = "Number of Users",
  ylab = "Average Response Time (seconds)",
  main = "Average Response Time vs Number of Users",
  type = "o"
)