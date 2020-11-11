# ---
rm(list = ls()); gc()
source("./code_function/pkgs.install.R", encoding = "UTF-8")
source("./code_function/pkgs.library.R", encoding = "UTF-8")
source("./code_function/get.filename.R", encoding = "UTF-8")



# ---
pkgs <- c("dplyr", "data.table", "lubridate", "zoo", "Nippon", "knitr")
sapply(pkgs, pkgs.install)
sapply(pkgs, pkgs.library)



# ---
chat_record <- list()
raw <- readLines("./data/phone/[LINE] NCHC Data Analysis的聊天.txt", encoding = "UTF-8")
# raw <- readLines("D:/public_folder/My_Honey/LINE紀錄/[LINE] 與余佑駿（little fish）的聊天_20191106.txt", encoding = "UTF-8")
chat_record["filename"] <- list(get.filename(x = raw))
chat_record["raw_context"] <- list(raw[-c(1:2)])



# ---
source("./code_function/fix.plain_line.R", encoding = "UTF-8")
source("./code_function/fix.tab01.R", encoding = "UTF-8")
source("./code_function/fix.combine_multi_msg.R", encoding = "UTF-8")
source("./code_function/pattern.count.R", encoding = "UTF-8")
source("./code_function/get.msg_format_err.R", encoding = "UTF-8")
source("./code_function/fix.tab02.R", encoding = "UTF-8")
source("./code_function/get.timedate.R", encoding = "UTF-8")
source("./code_function/get.weekday.R", encoding = "UTF-8")
source("./code_function/fix.dateNA.R", encoding = "UTF-8")
source("./code_function/get.timestamp.R", encoding = "UTF-8")
source("./code_function/fix.context_quote.R", encoding = "UTF-8")
tmp01 <- chat_record$raw_context %>% 
  fix.plain_line(x = .) %>% 
  fix.tab01(x = .) %>% 
  fix.combine_multi_msg(x = .)

chat_record["msg_format_err"] <- tmp01$combine_context %>% 
  get.msg_format_err(x = .) %>% 
  list()

tmp02 <- tmp01 %>% 
  fix.tab02(x = .) %>% 
  get.timedate(x = .) %>% 
  get.weekday(x = .) %>% 
  fix.dateNA(x = .) %>% 
  get.timestamp(x = .) %>% 
  fix.context_quote(x = .)

chat_record["split_col"] <- list(tmp02)



# ---
chat_record["daily_summary_user"] <- chat_record$split_col %>% 
  .[, .(context_num = .N), by = .(timedate, weekday, user)] %>% 
  list()
chat_record["daily_summary_total"] <- chat_record$split_col %>% 
  .[, .(context_num = .N), by = .(timedate, weekday)] %>% 
  list()



# ---
source("./code_function/pattern.exist.R", encoding = "UTF-8")
source("./code_function/context_extract.R", encoding = "UTF-8")

chat_record["context_extract"] <- chat_record$split_col %>% 
  context_extract(split_col = .) %>% 
  list()


# ---
chat_record %>% names()
chat_record$filename
chat_record$raw_context %>% head
chat_record$msg_format_err %>% head
chat_record$split_col %>% View()
chat_record$daily_summary_user %>% View()
chat_record$daily_summary_total %>% View()
chat_record$context_extract %>% View()

