use context dcic2024
include csv
include data-source

flights = load-table: 
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
end
#print flights
flights
  


#lab 4 ta notes
#filter-with(table, lam(r :: Row): __ end)
#build-column(table, "new-name", lam(r :: Row): __ end)
#transform-column(table, "column-name", lam(n :: Number): __ end)

#ex: filter-with(flights, lam(r :: Row): r["distance"] >= 1500 end)
#ex: filter-with(flights, is-long-flight)


#1
#checks if row-dist >= 1500
fun is-long-flight(row :: Row) -> Boolean:
  doc: "boolean that checks to see if the row's distance is greater or equal to 1500"
  row["distance"] >= 1500
end #end of is-long-flight

  #| where: 
  is-long-flight(flights.row-n(1)) is false
  |# 

#Use filter-with to keep only the long flights. 
#filter-with(flights, lam(r :: Row): is-long-flight(r) end)
filter-with(flights, is-long-flight)



