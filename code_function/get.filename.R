get.filename <- function(x){
  filename_n1 <- raw[1] %>% 
    sub("\\[LINE\\] ", "", .) %>% 
    sub("(.*)的聊天記錄$", "\\1", .) %>% 
    zen2han() %>% 
    gsub(" ", "_", .)
  tt <- filename_n1 %>% charToRaw() %>% head(3)
  if (sum(tt==c("ef", "bb", "bf"))==3) {
    filename_n1 <- filename_n1 %>% 
      charToRaw() %>% tail(-3) %>% rawToChar() %>% 
      iconv(x = ., from = "UTF-8", "UTF-8")
  }
  
  filename_n2 <- raw[4] %>% 
    sub("([0-9]{4}/[0-9]{2}/[0-9]{2})(.*)", "\\1", .) %>% 
    gsub("/", "", .)
  
  filename_n3 <- raw[2] %>% 
    sub("(.*)([0-9]{4}/[0-9]{2}/[0-9]{2})(.*)", "\\2", .) %>% 
    gsub("/", "", .)
  
  filename <- paste(filename_n1, filename_n2, filename_n3, sep = "-")
  return(filename)
}
