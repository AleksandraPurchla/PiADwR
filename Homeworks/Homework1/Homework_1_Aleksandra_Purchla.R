gas_files <- list.files("~/PiADR", full.names=TRUE)
##base
gas_dfs = lapply(gas_files, read.csv)
gas_base = do.call("rbind", gas_dfs)
## tv
gas_dfs_tv = lapply(gas_files, read_csv)
gas_tv = bind_rows(gas_dfs_tv)
## dt
gas_dfs_dt = lapply(gas_files, fread)
gas_dt = rbindlist(gas_dfs_dt)

procentNA = function(vector)
{
  sum(is.na(vector))/length(vector)
}

sapply(gas_base, procentNA)
summarise_all(gas_tv, procentNA)
gas_dt[, lapply(.SD, procentNA)]


