use context dcic2024
include csv

#lab 4 ta notes
#filter-with(table, lam(r :: Row): __ end)
#build-column(table, "new-name", lam(r :: Row): __ end)
#transform-column(table, "column-name", lam(n :: Number): __ end)

#ex: filter-with(flights, lam(r :: Row): r["distance"] >= 1500 end)
#ex: filter-with(flights, is-long-flight)

