dfArtAuction <- data.frame(
  amount_of_bid = c(1, 2, 3, 4),
  prob_of_mon_bid = c(0, 0.5, 0.5, 0),
  prob_of_tue_bid = c(0, 0.8, 0, 0.2)
)

standing_offer<-0.9
library(dplyr)
df_Tuesday<-dfArtAuction %>% 
  mutate(Tue_des = ifelse(amount_of_bid>standing_offer, "Accept", "Reject")) %>%
  mutate(Tue_val = ifelse(Tue_des=="Accept", prob_of_tue_bid * amount_of_bid, 
                          standing_offer * prob_of_tue_bid))

Tue_emv<-sum(df_Tuesday$Tue_val)

dfMonday<-df_Tuesday %>% 
  mutate(Mon_des = ifelse(amount_of_bid > Tue_emv, "Accept", "Reject")) %>% 
  mutate(Mon_val = ifelse(Mon_des == "Accept", prob_of_mon_bid * amount_of_bid,
                          prob_of_mon_bid * Tue_emv))
Mon_emv<-sum(dfMonday$Mon_val)
