get.weekday <- function(x){
  idx.daily_begin <- x$combine_context %>% 
    grepl("^[0-9]{4}/[0-9]{2}/[0-9]{2}.{3}$", .) %>% which
  tmp <- rep(NA, nrow(x))
  tmp[idx.daily_begin+1] <- x$combine_context[idx.daily_begin] %>% 
    gsub(".*(一|二|三|四|五|六|日).*", "\\1", .)
  res <- x[, `:=`(weekday = tmp)]
  return(res)
}
