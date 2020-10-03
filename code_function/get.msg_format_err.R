get.msg_format_err <- function(x){
  t1 <- x %>% pattern.count(., pattern = "\t")
  
  msg_format_err <- NULL
  if (sum(t1==1)>0){
    idx <- which(t1==1)
    msg_format_err <- x[idx]
  }
  res <- msg_format_err
  return(res)
}
