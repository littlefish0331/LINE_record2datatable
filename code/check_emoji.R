# [如何將表情符號與R正則表達式匹配？ - 堆棧溢出](https://stackoverflow.com/questions/43359066/how-can-i-match-emoji-with-an-r-regex)

library(stringr)
xvect = c('☎', '😂', 'no', '🍹', '😀', 'no', '😛')

Encoding(xvect) <- "UTF-8"
which(str_detect(xvect,"[^[:ascii:]]")==T)
# [1] 1 3 4 6

# ---
# devtools::install_github("richfitz/remoji")
library(remoji)
emj <- emoji(list_emoji(), TRUE)
xvect %in% trimws(emj)
which(xvect %in% trimws(emj))

# ---
grepl(pattern = '[\U{1F300}-\U{1F6FF}]', x = xvect, perl = T)
xvect[grepl('[\U{1F300}-\U{1F6FF}]', xvect, perl = T)]

# ---
library(stringi)
stri_escape_unicode(str = xvect) %>% grepl('\\U[0-9a-zA-Z]{8}', .)
