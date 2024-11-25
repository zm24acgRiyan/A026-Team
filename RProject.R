library(readr)
Match <- read_csv("Match.csv")
View(Match)

# Remove rows with missing values in the Match_Winner column
data <- na.omit(data)

# Calculate the counts for each category
toss_winner_win <- sum(data$Toss_Winner_Match_Winner == TRUE)
toss_winner_loss <- sum(data$Toss_Winner_Match_Winner == FALSE & data$Toss_Winner != data$Match_Winner) # Toss Winner loses
toss_loser_win <- sum(data$Toss_Winner_Match_Winner == FALSE & data$Toss_Winner != data$Match_Winner) # Toss Loser wins
toss_loser_loss <- sum(data$Toss_Winner_Match_Winner == FALSE & data$Toss_Winner == data$Match_Winner) # Toss Loser loses

# Total number of matches
total_matches <- nrow(data)

# Calculate the percentage for each category
toss_winner_win_percentage <- (toss_winner_win / total_matches) * 100
toss_winner_loss_percentage <- (toss_winner_loss / total_matches) * 100
toss_loser_win_percentage <- (toss_loser_win / total_matches) * 100
toss_loser_loss_percentage <- (toss_loser_loss / total_matches) * 100

# Create a new data frame with the calculated percentages
data_plot <- data.frame(
  Toss_Outcome = c("Toss Winner", "Toss Winner", "Toss Loser", "Toss Loser"),
  Result = c("Winner Wins", "Winner Loses", "Loser Wins", "Loser Losses"),
  Percentage = c(toss_winner_win_percentage, toss_winner_loss_percentage, toss_loser_win_percentage, toss_loser_loss_percentage)
)

# Create a new data frame with the calculated percentages
data_plot <- data.frame(
  Toss_Outcome = c("Toss Winner", "Toss Winner", "Toss Loser", "Toss Loser"),
  Result = c("Winner Wins", "Winner Loses", "Loser Wins", "Loser Losses"),
  Percentage = c(toss_winner_win_percentage, toss_winner_loss_percentage, toss_loser_win_percentage, toss_loser_loss_percentage)
)



