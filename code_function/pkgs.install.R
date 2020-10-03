# ---
# 輸入: 套件名稱，向量+sapply送入
# 輸出: 無
pkgs.install <- function(pkgs, 
                         pkgs_installed = rownames(installed.packages()), 
                         pkgs_available = rownames(available.packages())){
  if (pkgs %in% pkgs_installed) return("already installed!")
  else {
    if (pkgs %in% pkgs_available) {
      install.packages(pkgs)
      return("install success!")
    } else {
      msg <- paste0("'", pkgs, "' is not a valid package - please check again.")
      print(msg)
      return("FAIL!")
    }
  }
}
