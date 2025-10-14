use context dcic2024
include csv
include data-source

flights-sam = load-table: 
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
#print flights
flights-sam

#cleanup plan
#delay: change all negative numbers to 0 
#tailnum: "" becomes unaccounted
#--------------------------------------------
#transform-column for dep-delay
#new table that changes flight so that dep-delay time with < 0 changed to 0
flights-sam1 = transform-column(flights-sam,"dep-delay",
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
flight-sam2 = transform-column(flights-sam1,"arr-delay",
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
flight-sam2

#transform-column for tailnum
#new table changes tailnum so that if there's "" it will be replaced with "unknown"
fun blank-to-unknown(s :: String) -> String:
  doc: "replaces an empty string with unknown"
  if s == "":
    "UNKNOWN"
  else:
    s
  end
end
#for tailnum, "" = UNKNOWN
flight-sam3 = transform-column(flight-sam2, "tailnum", blank-to-unknown)
flight-sam3