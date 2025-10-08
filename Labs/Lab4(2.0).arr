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


#Exercise 1 — Long Flights
#checks if row-dist >= 1500
fun is-long-flight(r :: Row) -> Boolean:
  doc: "function that checks if distance of a flight is greater or equal to 1500"
  d = r["distance"]
  num-opt = string-to-number(d)
  cases (Option) num-opt:
    | some(num-d) => num-d >= 1500
    | none => false
  end

where: 
  is-long-flight(flights.row-n(1)) is false
end #end of is-long-flight


#Use filter-with to keep only the long flights. 
long-flights = filter-with(flights, lam(r :: Row): is-long-flight(r) end)
#print long-flights
long-flights


#order resulting table by 'air time' descending
long-flights-air-time = order-by(long-flights, "air-time", false)
#prints table sorted by air time
long-flights-air-time


#extract carrier, origin, and dest of row one, long-flights-air-time, which has largest air time
row1 = long-flights-air-time.row-n(0)
carrier = row1["carrier"]
origin = row1["origin"]
destination = row1["dest"]
#print the three extracted which 
carrier 
origin 
destination




#