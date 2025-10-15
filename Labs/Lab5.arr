use context dcic2024
include csv
include data-source
include tables



flights-53 = load-table: 
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
  
  source: csv-table-file("flights_sample53.csv", default-options)
end
'print flights-53, aka the base table'
flights-53

#TASK 1 - cleanup plan
#delay: change all negative numbers to 0 
#tailnum: "" becomes unaccounted
#carrier: " b6 ", erase excess spaces and capitalize


#--------------------------------------------
#TASK 2
#1. tailnum "" to "UNKNOWN"
fun blank-to-unknown(s :: String) -> String:
  doc: 'replaces an empty string with UNKNOWN'
  if s == "":
    "UNKNOWN"
  else:
    s
  end
end
#for tailnum, "" = UNKNOWN
flights-53-unknown = transform-column(flights-53, "tailnum", blank-to-unknown)

#2. dep-delay, arr-delay change negative to 0
#transform-column for dep-delay
#new table that changes flight so that dep-delay time with < 0 changed to 0
flights-53-dep-delay = transform-column(flights-53-unknown,"dep-delay",
  lam(n):
    num-opt = string-to-number(n)
    cases (Option) num-opt:
      | some(num) => 
        if num < 0: 0 
        else: num end
      | none => 0
    end
  end
)

#transform-column for arr-delay
#new table that changes flight so that arr-delay time with < 0 changed to 0
flights-53-arr-delay = transform-column(flights-53-dep-delay,"arr-delay",
 lam(n):
    num-opt = string-to-number(n)
    cases (Option) num-opt:
      | some(num) => 
        if num < 0: 0 
        else: num end
      | none => 0
    end
  end
)
'flights with arr-delay'
flights-53-arr-delay

#3. identify duplicate rows from the table
# Trim spaces at both ends
fun trim(s :: String) -> String:
  doc: "Remove spaces from the given string."
  n = string-length(s)
  if n == 0:
    ""
  else:
    string-replace(s, " ", "")
  end
end

#convert time to hour:minutes
fun time(time-num :: Number) -> String:
  doc: "Convert numeric time to HH:MM format"
  hours = num-floor(time-num / 100)
  minutes = num-remainder(time-num, 100)
  
  # Convert to strings
  h = tostring(hours)
  m = tostring(minutes)
  
  # Pad with zeros if needed
  hours-str = if hours < 10: 
    string-append("0", h)
  else: 
    h
  end
  
  minutes-str = if minutes < 10: 
    string-append("0", m)
  else: 
    m
  end
  
  string-append(string-append(hours-str, ":"), minutes-str)
end

#create dedup-key column
 flights-dedup = build-column(flights-53-arr-delay, "dedup_key",
   lam(r):
     #convert flight to string
     flight-str = to-string(r["flight"])
     #normalize carrier and uppercase carrier
     trimmed-carrier = trim(r["carrier"])
     carrier-norm = string-toupper(trimmed-carrier)
     #normalize dep-time to hours:minutes
     dep-time-num = string-to-number(r["dep-time"])
     new-dep-time = cases (Option) dep-time-num:
       | some(num) => time(num)
       | none => "00:00"  # fallback for invalid times
    end
     #put together flight-carrier-dep-time
    flight-str + "-" + carrier-norm + "-" + new-dep-time
  end)
 
#display new table
'flights with dedup'
flights-dedup
  
#group by dedup and count duplicates
dupli-summary = count(flights-dedup, "dedup_key")

#filter to display duplicates 
dupli-only = dupli-summary.filter(lam(row): row["count"] > 1 end)
'duplicate entries'
dupli-only

#convert dep-time to hours:minute
flights-normalized = transform-column(flights-dedup, "dep-time",
  lam(dt):
    num-opt = string-to-number(dt)
    cases (Option) num-opt:
      | some(num) => time(num)
      | none => "00:00"  # fallback for invalid times
    end
  end)

'flights with normalized dep-time'
flights-normalized

flight-task2 = transform-column(flights-normalized, "carrier",
  lam(c):
    trimmed = trim(c)
    string-toupper(trimmed)
  end)

'flights with normalized carrier'
flight-task2


#-----------------------------------
#TASK4
#1. make charts

#bar-chart of number of carriers
#counts all the carriers and the number of times they've appeared
carrier-counts = count(flight-task2, "carrier")
'carrier count table'
carrier-counts
#sorts the carrier in descending order
carrier-sorted = carrier-counts.order-by("count", false)
'carrier soted table'
carrier-sorted 
#create the bar chart 
'bar chart of num of carriers'
bar-chart(carrier-sorted, "value", "count")


#histogram of flight distances
#extract distance values
distance-values = flight-task2.build-column("distance_num",
  lam(r):
    num-opt = string-to-number(r["distance"])
    cases (Option) num-opt:
      | some(num) => num
      | none => 0
    end
  end)
#create histogram
'histogram of flight distances'
histogram(distance-values, "distance_num", 10)


#scatter plot of air-time vs. distance
#new columns with num values
flight-scatter = flight-task2.build-column("distance-num",
  lam(r):
    num-opt = string-to-number(r["distance"])
    cases (Option) num-opt:
      | some(num) => num
      | none => 0
    end
  end).build-column("air-time-num",
  lam(r):
    num-opt = string-to-number(r["air-time"])
    cases (Option) num-opt:
      | some(num) => num
      | none => 0
    end
  end)
#create scatter plot 
'scatter plot of air time vs distance'
scatter-plot(flight-scatter, "distance-num", "air-time-num")


#2. extract 'distance' column as list
distance-list = flight-task2.column("distance")
'distance list'
distance-list


#3. use for each loop
#compute total distance flown
var total-grand = 0
var max-dist = 0
var total-count = 0
for each(dist from distance-list): 
  #convert from string to num
  num-opt = string-to-number(dist)
  cases (Option) num-opt:
  | some(num) =>
    block:
        total-grand := total-grand + num
        total-count := total-count + 1
      max-dist := if num > max-dist: num else: max-dist end
    end
  | none => nothing
end
end
'total dist'
total-grand

#compute average distance
average-dist = total-grand / total-count
'average dist'
average-dist

#compute max distance
'max dist'
max-dist