library(tidyverse)
library(here)

dat <- read_csv(here("data", "dictionary.csv"))

quechua <- dat %>%
  select(
    quechua
  )

# Words with e or o
e_o <- dat %>%
  filter(grepl("[eo]", quechua, ignore.case = TRUE)
  )

# Loanwords with e or o
eo_loan <- e_o %>%
  filter(grepl('sp', english, ignore.case = TRUE)
         )

# Words with q and e and/or o
eo_q <- e_o %>%
  filter(grepl('q', quechua, ignore.case = TRUE)
         )

# Words with e or o, not loan words and not with q or j
eo_q_notloan <- e_o %>%
  filter(
    !grepl('q', quechua, ignore.case = TRUE),
    !grepl('sp', english, ignore.case = TRUE),
    !grepl('dios', quechua, ignore.case = TRUE),
    !grepl("jo|oj|ej|je", quechua, ignore.case = TRUE),
    !grepl('primo', quechua, ignore.case = TRUE),
    !grepl('prof', quechua, ignore.case = TRUE),
    !grepl('pred', quechua, ignore.case = TRUE),
    !grepl('feria', quechua, ignore.case = TRUE),
    !grepl('hora', quechua, ignore.case = TRUE),
    !grepl('patron', quechua, ignore.case = TRUE),
    !grepl('mormon', quechua, ignore.case = TRUE),
  )

# Words with j
j <- dat %>%
  filter(grepl("j", quechua, ignore.case = TRUE)
         )

# Words with j, o, and e
joe <- j %>%
  filter(grepl("[eo]", quechua, ignore.case = TRUE))

# Words with j, not o and e, not loan
j_not_oe <- j %>%
  filter(!grepl("[eo]", quechua, ignore.case = TRUE),
         !grepl("sp", english, ignore.case = TRUE))

# Words with j, o, and e not loanwords
joe_notloan <- j %>%
  filter(grepl("[eo]", quechua, ignore.case = TRUE),
         !grepl("sp", english, ignore.case = TRUE))

# Words with e, not qe/eq
qe_nonadjacent <- e_o %>%
  filter(grepl("e", quechua, ignore.case = TRUE),
         !grepl("qe|eq", quechua, ignore.case = TRUE),
         !grepl("[sp]", english, ignore.case = TRUE)
  )

# Words with o, not qo/oq
qo_nonadjacent <- e_o %>%
  filter(grepl("o", quechua, ignore.case = TRUE),
         !grepl("qo|oq", quechua, ignore.case = TRUE),
         !grepl("[sp]", english, ignore.case = TRUE)
  )
