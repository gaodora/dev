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
fun is-long-flight(r :: Row) -> Boolean: 
  doc: "boolean that checks to see if the row's distance is greater or equal to 1500"
  d = r["distance"]
  if is-number(d) and (d >= 1500): 
    true
  else: 
    false
  end

where: 
  is-long-flight(flights.row-n(1)) is false
  is-long-flight(flights.row-n(14)) is true
end #end of is-long-flight

#Use filter-with to keep only the long flights. 
long-flights = filter-with(flights, lam(r :: Row): is-long-flight(r) end)
#print long-flights
long-flights

#Order the resulting table by "air_time" descending (largest first).
#false = descending, true = ascending
sorted-long-flights = long-flights.order-by("air-time", false)

#idk if it will print so, print just in case
long-flights

#Extract the carrier, origin, and dest of the first row
