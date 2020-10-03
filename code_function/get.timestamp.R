get.timestamp <- function(x){
  t1 <- x[, c("timestamp_12", "user", "context") := tstrsplit(combine_context, "\t", fixed = TRUE)]
  t1$timestamp <- t1$timestamp_12 %>% 
    strptime(., "%p%I:%M") %>% format(., "%H:%M")
  res <- t1[, `:=`(iid = 1:nrow(t1))
            ][, .(iid, timedate, weekday, timestamp, user, context)]
  return(res)
}
