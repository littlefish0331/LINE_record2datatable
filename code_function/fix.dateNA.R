fix.dateNA <- function(x){
  idx.daily_begin <- x$combine_context %>% 
    grepl("^[0-9]{4}/[0-9]{2}/[0-9]{2}.{3}$", .) %>% which
  res <- x[-idx.daily_begin, !"group_line"]
  res$timedate <- na.locf(res$timedate, fromLast = F)
  res$weekday <- na.locf(res$weekday, fromLast = F)
  return(res)
}
