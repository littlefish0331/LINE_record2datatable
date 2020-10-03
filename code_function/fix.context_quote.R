fix.context_quote <- function(x){
  x$context <- x$context %>% gsub('^"(.*)"$', "\\1", .)
  res <- x
  return(res)
}
