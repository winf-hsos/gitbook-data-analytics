# Load from multiple files

This code snippet is inspired by the [Tidyverse Booster email course by Christian Burkhart](https://christianb.gumroad.com/l/tidyverse-booster):

```
library(tidyverse)
library(fs)
library(here)
csv_files <- dir_ls(path = here("sessions/many_files/"),
                    glob = "*.csv", type = "file")
csv_files
data_merged <- read_csv(csv_files,
                        id = "filename", 
                        show_col_types = FALSE)
```
