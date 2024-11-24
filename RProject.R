# Load the dataset
data <- read.csv("Match.csv")

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

# Create the stacked bar chart with the calculated values
ggplot(data_plot, aes(x = Toss_Outcome, y = Percentage, fill = Result)) +
  geom_bar(stat = "identity", width = 0.6) +
  geom_text(
    aes(label = paste0(round(Percentage, 2), "%")),
    position = position_stack(vjust = 0.5),
    size = 4
  ) +
  scale_fill_manual(
    values = c(
      "Winner Wins" = "lightblue",
      "Winner Loses" = "orange",  # Added color for Toss Winner losing
      "Loser Wins" = "salmon",
      "Loser Losses" = "#8A2BE2"  # Violet color for Toss Loser losing
    )
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +  # Add space above bars
  labs(
    title = "Proportion of Matches Won and Lost by Toss Outcome",
    x = "Toss Outcome",
    y = "Proportion of Matches (%)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14),
    axis.title = element_text(size = 12),
    legend.title = element_blank()
  )



