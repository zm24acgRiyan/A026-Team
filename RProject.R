# Load the dataset
data <- read.csv("Match.csv")

# Remove rows with missing values in the Match_Winner column
data <- na.omit(data)

# Calculate the counts for each category
toss_winner_win <- sum(data$Toss_Winner_Match_Winner == TRUE)
toss_winner_loss <- sum(data$Toss_Winner_Match_Winner == FALSE & data$Toss_Winner != data$Match_Winner) # Toss Winner loses
toss_loser_win <- sum(data$Toss_Winner_Match_Winner == FALSE & data$Toss_Winner != data$Match_Winner) # Toss Loser wins
toss_loser_loss <- sum(data$Toss_Winner_Match_Winner == FALSE & data$Toss_Winner == data$Match_Winner) # Toss Loser loses