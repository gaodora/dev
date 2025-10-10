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
new-dep-delay = transform-column(flights,"dep-delay",
  lam(n):
    num-opt = string-to-number(n)
    cases (Option) num-opt:
      | some(num) => if num < 0: 0 else: num end
      | none => 0
    end
  end
)
"new table that changes flight so that delay time with < 0 changed to 0"
new-dep-delay

#transform-column for arr-delay
arr-delay = transform-column(new-dep-delay,"arr-delay",
  lam(n):
    num-opt = string-to-number(n)
    cases (Option) num-opt:
      | some(num) => if num < 0: 0 else: num end
      | none => 0
    end
  end)


#add new column
#calculate effective speed for the add new column
#function that calculates effective speed
fun calc-eff-spd(r :: Row) -> Number:
  dist-opt = string-to-number(r["distance"])
  air-opt = string-to-number(r["air-time"])
  cases (Option) dist-opt:
    | some(dist) =>
      cases (Option) air-opt:
        | some(air) =>
            if air > 0:
              dist / (air / 60)
            else:
              0
            end
        | none => 0
      end
    | none => 0
  end
end
#build-column for effective speed
eff-spd = build-column(flights, "effective-speed", lam(r :: Row): calc-eff-spd(r) end)
eff-spd 

#order by effective speed in descending order
order-eff-spd = order-by(eff-spd, "effective-speed", false)
"order-eff-spd"
order-eff-spd

#extract carrier, origin, and dest of fastest flight, row1
row-fast = order-eff-spd.row-n(0)
carrier-fast = row-fast["carrier"]
origin-fast = row-fast["origin"]
destination-fast = row-fast["dest"]

#print the three extracted which 
"carrier"
carrier-fast
"origin"
origin-fast
"dest"
destination-fast




#4 — Discount Late Arrivals + On-Time Score
#function that makes table t and reduces arr-delay by 20% only when 0 ≤ arr_delay ≤ 45
fun apply-arrival-discount(t :: Table) -> Table:
  doc: "Reduces arr_delay by 20% only when 0 <= arr-delay <= 45, else leaves value unchanged."
  transform-column(t, "arr-delay",
    lam(n):
      num-opt = string-to-number(n)
      cases (Option) num-opt:
        | some(num) =>
          if (num >= 0) and (num <= 45):
              num * 0.8
            else:
              num
            end
        | none => n
      end
    end)
end

#discount on flight discounted table 
flights-discounted = apply-arrival-discount(flights)

"flights with arrival delay discounted (20% off for 0 ≤ arr_delay ≤ 45)"
flights-discounted


#function for creating time score
fun calc-on-time-score(r :: Row) -> Number:
  doc: "process dep-delay, arr-delay, and air time to calculate time score"
  
  a-num = string-to-number(r["dep-delay"])
  a = cases (Option) a-num:
    | some(d) => if d < 0: 0 else: d end
    | none => 0
  end
 
  b-num = string-to-number(r["arr-delay"])
  b = cases (Option) b-num:
    | some(d) => if d < 0: 0 else: d end
    | none => 0
  end
  
  e-num = string-to-number(r["air-time"])
  e = cases (Option) e-num:
    | some(d) => if d < 0: 0 else: d end
    | none => 0
  end
  
  #calc score
  score = 100 - (a - b) - (e / 30)
  if score < 0:
    0
  else:
    score
  end
end

#creating column time score
time-score-table = build-column(flights, "on_time_score", lam(r :: Row): calc-on-time-score(r) end)
"time-score in table"
time-score-table

#order by time score in ascending order
order-time-score = order-by(time-score-table, "on-time-score", true)
"ordered-time-score"
order-time-score


#extract carrier, origin, and dest of fastest flight, row1
row-ti = order-time-score.row-n(0)
carrier-ti = row-ti["carrier"]
flight-ti = row-ti["flight"]
origin-ti = row-ti["origin"]
destination-ti = row-ti["dest"]

#print the three extracted which 
"carrier"
carrier-ti
"flight" 
flight-ti
"origin"
origin-ti
"dest"
destination-ti