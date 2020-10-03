fix.tab02 <- function(x){
  t1 <- x$combine_context %>% pattern.count(., pattern = "\t")
  
  if (sum(t1>2)>0) {
    idx <- which(t1>2)
    for (idx_i in 1:length(idx)) {
      tt1 <- idx[idx_i]
      t2_in_context <- x$combine_context[tt1] %>% gregexpr("\t", .) %>% `[[`(1) %>% `[`(2)
      tt2 <- x$combine_context[tt1] %>% 
        substring(., first = 1, last = t2_in_context)
      tt3 <- x$combine_context[tt1] %>% 
        substring(., first = t2_in_context+1, last = nchar(x$combine_context[tt1])) %>% 
        gsub("\t", " ", .)
      x$combine_context[tt1] <- paste0(tt2, tt3)
    }
  }
  res <- x
  return(res)
}
