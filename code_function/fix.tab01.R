fix.tab01 <- function(x){
  res <- x %>% 
    gsub("(\u2068|\u2069)", "", .) %>% 
    gsub("(\t)+", "\t", .) %>% 
    gsub("(.*\t.*)(已收回訊息)$", "\\1\t\\2", .) %>% 
    gsub("(.*\t.*) (unsent a message.)$", "\\1\t\\2", .) %>% 
    gsub("(.*\t.*)(刪除了.*相簿內的照片)$", "\\1\t\\2", .) %>% 
    gsub("(.*\t.*)(已將相簿名稱由.*改為.*)$", "\\1\t\\2", .) %>% 
    gsub("(.*\t.*) (changed the name of the album.*to.*)$", "\\1\t\\2", .)
  return(res)
}
