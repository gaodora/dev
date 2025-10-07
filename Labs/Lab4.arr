use context dcic2024
include csv
include data-source
#lab 4 ta notes
#filter-with(table, lam(r :: Row): __ end)
#build-column(table, "new-name", lam(r :: Row): __ end)
#transform-column(table, "column-name", lam(n :: Number): __ end)

#ex: filter-with(flights, lam(r :: Row): r["distance"] >= 1500 end)
#ex: filter-with(flights, is-long-flight)

flights = load table: 
  row-names :: Number,
  dep-time :: Number, 
  sched-dep-time :: Number,
  dep-delay :: Number,
  arr-time :: Number,
  sched-arr-time :: Number,
  arr-delay :: Number,
  carrier :: String,
  flight :: Number,
  tailnum :: String,
  origin :: String,
  dest :: String, 
  air-time :: Number,
  distance :: Number,
  hour :: Number,
  minute :: Number,
  time-hour :: String
  source: csv-table-file("flights.csv", default-options)
  sanitize row-names using num-sanitizer
  sanitize dep-time using num-sanitizer
  sanitize sched-dep-time using num-sanitizer
  sanitize dep-delay using num-sanitizer
  sanitize arr-time using num-sanitizer
  sanitize sched-arr-time using num-sanitizer
  sanitize arr-delay using num-sanitizer
  sanitize flight using num-sanitizer
  sanitize air-time using num-sanitizer
  sanitize distance using num-sanitizer
  sanitize hour using num-sanitizer
  sanitize minute using num-sanitizer
end

flights
  