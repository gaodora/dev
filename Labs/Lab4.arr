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
    #|
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
    |#
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

where: 
  is-long-flight(flights.row-n(1)) is false
  is-long-flight(flights.row-n(14)) is true
end #end of is-long-flight

#Use filter-with to keep only the long flights. 
long-flights = filter-with(flights, lam(row :: Row): is-long-flight(row) end)
#print long-flights
long-flights

#Order the resulting table by "air_time" descending (largest first).
long-flights.order-by("air-time") 
#idk if it will print so, print just in case
long-flights

#Extract the carrier, origin, and dest of the first row
fun extra(row :: Row):
  doc: "extracts the carrier, origin, and dest of the first row of long-flights which is the longest time and has a distance >= to 1500"
  carry = extract "carrier" from long-flights end
end