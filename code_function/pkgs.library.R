# ---
# 輸入: 套件名稱，向量+sapply送入
# 輸出: 無
pkgs.library <- function(pkgs){
  # 如果不想要有訊息可用下面語法替換。
  # suppressMessages(library(pkg, character.only = TRUE))
  library(pkgs, character.only = TRUE)
  return(NULL)
}
