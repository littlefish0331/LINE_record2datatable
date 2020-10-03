pattern.count <- function(x, pattern){
  res <- x %>% 
    gregexpr(pattern, .) %>% 
    lapply(., function(x) sum(x!=-1) ) %>% unlist()
  return(res)
}
