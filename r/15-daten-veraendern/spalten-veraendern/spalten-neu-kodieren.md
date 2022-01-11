# Spalten neu kodieren

```r
limo %>% 
  select(f10_kauf_party_pflicht, f44_studiengang) %>%
  mutate(f44_studiengang = recode(f44_studiengang, `1` = "BAH", `2` = "BLW", `3` = "BLP", `4` = "OEC
```
