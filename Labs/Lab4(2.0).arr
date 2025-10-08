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

"long-flights"
long-flights


#order resulting table by 'air time' descending
long-flights-air-time = order-by(long-flights, "air-time", false)

"long-flights-air-time"
long-flights-air-time


#extract carrier, origin, and dest of row one, long-flights-air-time, which has largest air time
row1 = long-flights-air-time.row-n(0)
carrier = row1["carrier"]
origin = row1["origin"]
destination = row1["dest"]

#print the three extracted which 
"carrier"
carrier 
"origin"
origin 
"dest"
destination




#Exercise 2 — Delayed Morning Flights
#checks if a flight has been delayed by 30 or more
fun is-delayed-depart(r :: Row) -> Boolean:
  doc: "function that checks if a flight has been delayed by 30 or more"
  d = r["dep-delay"]
  num-opt = string-to-number(d)
  cases (Option) num-opt:
    | some(num-d) => num-d >= 30
    | none => false
  end

where: 
  is-delayed-depart(flights.row-n(0)) is false
end #end of is-delayed-depart


#checks if the sch-dep before noon
fun is-morning-sched-dep(r :: Row) -> Boolean:
  doc: "function that checks if a flight's scheduled departure is before noon"
  sd = r["sched-dep-time"] 
  num-opt = string-to-number(sd)
  cases (Option) num-opt:
    | some(num-sd) => num-sd < 1200
    | none => false
  end
where: 
  is-morning-sched-dep(flights.row-n(0)) is true
end #end of is-delayed-depart


#use lambda with filter-with to keep flights with delayed departures >=30
delayed-flights = filter-with(flights, lam(r :: Row): is-delayed-depart(r) end)
"delayed flights"
delayed-flights

#use lambda filter to keep only flights shceduled before noon 
before-noon = filter-with(delayed-flights, lam(r :: Row): is-morning-sched-dep(r) end)
"shed dep before noon from the delayed flights by 30 or more"
before-noon


#filter to keep only flights where distance > 500 
fun noon-long-flight(r :: Row) -> Boolean:
  doc: "function that keeps flights with a distance greather than 500"
  d = r["distance"]
  num-opt = string-to-number(d)
  cases (Option) num-opt: 
    | some(num-d) => num-d > 500
    | none => false
  end
end #end of noon-long-flight
noon-500 = filter-with(before-noon, lam(r :: Row): noon-long-flight(r) end)
"shed dep before noon from the delayed flights by 30 or more and has a distance greater than 500"
noon-500


#order this massive subset in descending order aka the worst delayed flights first 
worst-delay = order-by(noon-500, "dep-delay", false)

"worst delays first"
worst-delay


#extract flight number, origin, and dep-delay of the worst delayed flight in subset aka row1
wor-row1 = worst-delay.row-n(0)
fli-num = wor-row1["flight"]
orig = wor-row1["origin"]
dep-delay = wor-row1["dep-delay"]

#print the three extracted which 
"flight num"
fli-num
"origin"
orig
"departure delay"
dep-delay




#3 — Clean Delays + Compute Effective Speed
#transform-column for dep-delay
transform-column(flights, "dep-delay", )