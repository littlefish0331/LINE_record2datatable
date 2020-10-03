fix.combine_multi_msg <- function(x){
  is.daily_begin <- x %>% 
    grepl("^[0-9]{4}/[0-9]{2}/[0-9]{2}.{3}$", .) %>% ifelse(., 1, 0)
  is.msg_begin <- x %>% 
    grepl("(上午|下午)[0-9]{2}:[0-9]{2}\t.*", .) %>% ifelse(., 1, 0)
  is.single_line <- ifelse((is.daily_begin + is.msg_begin)==0, 0, 1)
  
  res <- data.table(raw_context = x, 
                    single_line = is.single_line, 
                    group_line = cumsum(is.single_line)) %>% 
    .[, .(combine_context = paste0(raw_context, collapse = "\n")), by = group_line]
  
  return(res)
}
