# load Lott dictionary
dat_lott <- read_csv(here("data", "dictionary.csv"))

# load hubbbel corpus
dat_hubbel <- readLines(here("data","hubbel2016acquiring.txt"))

# clean hubbel data
all_words <- unlist(str_split(dat_hubbel, "\\s+"))
words_with_q <- all_words[str_detect(all_words, "q")]
words_with_q <- gsub("[^a-zA-Z']", "", words_with_q)
words_with_q <- tolower(words_with_q)
dat_hubbel_q <- data.frame(quechua = words_with_q,
                    english = "")

# combine dfs
all_dat <- dat_hubbel_q %>% rbind(dat_lott)

# select only quechua col
quechua <- all_dat %>%
  select(
    quechua
  )