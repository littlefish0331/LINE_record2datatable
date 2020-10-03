context_extract <- function(split_col){
  rows <- pattern.count(x = split_col$context, pattern = "\n") + 1
  is_url <- pattern.exist(x = split_col$context, pattern = "(https|http)")
  is_sticker <- pattern.exist(x = split_col$context, pattern = "^\\[貼圖\\]$")
  is_image <- pattern.exist(x = split_col$context, pattern = "^\\[照片\\]$")
  is_video <- pattern.exist(x = split_col$context, pattern = "^\\[影片\\]$")
  is_file <- pattern.exist(x = split_col$context, pattern = "^\\[檔案\\]$")
  is_voice <- pattern.exist(x = split_col$context, pattern = "^\\[語音訊息\\]$")
  is_note <- pattern.exist(x = split_col$context, pattern = "^\\[記事本\\]")
  is_album <- pattern.exist(x = split_col$context, pattern = "^\\[[相簿\\] \\(null\\)$")
  is_video_chat <- pattern.exist(x = split_col$context, pattern = "^\U260E")
  is_emoji <- pattern.exist(x = split_col$context, pattern = "[\U{1F300}-\U{1F6FF}]", perl = T)
  is_nopickup <- pattern.exist(x = split_col$context, pattern = "^\U260E 未接來電$")
  
  voice_video_length <- rep("-", nrow(split_col))
  idx <- pattern.exist(split_col$context, pattern = "^\U260E 通話時間") %>% which
  voice_video_length[idx] <- split_col$context[idx] %>% 
    gsub("(.*通話時間)([0-9:]+)", "\\2", .)
  
  res <- data.table(iid = split_col$iid,
                    rows = rows,
                    is_url = is_url,
                    is_sticker = is_sticker,
                    is_image = is_image, 
                    is_video = is_video,
                    is_file = is_file,
                    is_voice = is_voice,
                    is_note = is_note,
                    is_album = is_album,
                    is_video_chat = is_video_chat, 
                    is_emoji = is_emoji,
                    is_nopickup = is_nopickup,
                    voice_video_length = voice_video_length)
  return(res)
}
