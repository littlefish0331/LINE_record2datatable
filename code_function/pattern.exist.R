pattern.exist <- function(x, pattern, ...){
  res <- x %>% grepl(pattern, ., ...)
  return(res)
}
