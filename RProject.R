# Load the dataset
data <- read.csv("Match.csv")

# Remove rows with missing values in the Match_Winner column
data <- na.omit(data)
