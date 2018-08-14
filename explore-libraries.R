## Copy again, using fs ----
#install.packages('fs')
library(fs)
library(tidyverse)
library(ggplot2)

(from_dir <- path_home("Desktop", "day1_s2_explore-libraries"))
(from_files <- dir_ls(from_dir, glob = "*.R"))
(to_files <- path_file(from_files))
(out <- file_copy(from_files, to_files))
dir_ls()
dir_info()

## Sidebar: Why does Jenny name files this way? ----
library(tidyverse)
ft <- tibble(files = dir_ls(glob = "*.R"))
ft

# extra mystery line

ft %>%
  filter(str_detect(files, "explore"))

ft %>%
  mutate(files = path_ext_remove(files)) %>%
  separate(files, into = c("i", "topic", "flavor"), sep = "_")

dirs <- dir_ls(path_home("Desktop"), type = "directory")
(dt <- tibble(dirs = path_file(dirs)))
dt %>%
  separate(dirs, into = c("day", "session", "topic"), sep = "_")

## Principled use of delimiters --> meta-data can be recovered from filename