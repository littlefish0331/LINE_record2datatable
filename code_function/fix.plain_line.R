fix.plain_line <- function(x){
  idx.daily_begin <- x %>% grepl("^[0-9]{4}/[0-9]{2}/[0-9]{2}.{3}$", .) %>% which
  idx.plain_line <- idx.daily_begin - 1
  res <- x[-idx.plain_line]
  return(res)
}
