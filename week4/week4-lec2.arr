use context dcic2024
items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
  row: "Sword of Dawn",           23,  -87
  row: "Healing Potion",         -45,   12
  row: "Dragon Shield",           78,  -56
  row: "Magic Staff",             -9,   64
  row: "Elixir of Strength",      51,  -33
  row: "Cloak of Invisibility",  -66,    5
  row: "Boots of Swiftness",     -17,   49
  row: "Amulet of Protection",    82,  -74
  row: "Orb of Wisdom",          -29,  -21
end

items



#function to subtract -1 from the colum
fun subtract-1(n :: Number) -> Number:
  doc: "subtracts 1 from input"
  n - 1
where:
  subtract-1(10) is 9
  subtract-1(0) is -1
  subtract-1(-3.5) is -4.5
end

#use transform-column function to change values inside a column
moved-items = transform-column(items, "x-coordinate", subtract-1)

moved-items 



#creating new columns
fun calc-distance(r :: Row) -> Number:
  doc: "does distance to origin from fields 'x-coordinate' and 'y-coordinate'"
  num-sqrt(
    num-sqr(r["x-coordinate"]) + num-sqr(r["y-coordinate"]))
where:
  calc-distance(items.row-n(0)) is-roughly
    num-sqrt(num-sqr(23) + num-sqr(-87))
      
  calc-distance(items.row-n(3)) is-roughly
    num-sqrt(num-sqr(-9) + num-sqr(64))
end

items-with-dists = build-column(items, "distance", calc-distance)

items-with-dists


###############



#task 1
fun pull-closer(n :: Number) -> Number:
  doc: "multiplies coordinates by 0.9 to pull 10% closer to origin"
  n * 0.9
where: 
  pull-closer(10) is 9
  pull-closer(-20) is -18
  pull-closer(0) is 0
end 

#apply transform to both x and y coord
items-pulled-closer = transform-column(transform-column(items, "x-coordinate", pull-closer), "y-coordinate", pull-closer)

items-pulled-closer


#calculate dist function
fun calc-distance-squared(r :: Row) -> Number:
  doc: "calc squared dist from origin (avoids RoughNum)"
  num-sqr(r["x-coordinate"]) + num-sqr(r["y-coordinate"])
where: 
  calc-distance-squared(items.row-n(0)) is (num-sqr(23) + num-sqr(-87))
  calc-distance-squared(items.row-n(9)) is (num-sqr(-29) + num-sqr(-21))
end

#find the closest item to the player
items-with-dist = build-column(items, "distance-squared", calc-distance-squared)
items-sorted = order-by(items-with-dist, "distance-squared", true)
closest-item-name = items-sorted.row-n(0)["item"]

#display results
items-with-dist
closest-item-name



#obfuscate table 
fun obfuscate(i :: String) -> String:
  doc: "turn string into X's accounting for all letters and spaces"
  string-repeat("X", string-length(i)) 
where: 
  obfuscate(items.row-n(0)["item"]) is "XXXXXXXXXXXXX"
end

obfuscated = transform-column(items, "item", obfuscate)
#display
obfuscated


#lab 4 ta notes
#filter-with(table, lam(r :: Row): __ end)
#build-column(table, "new-name", lam(r :: Row): __ end)
#transform-column(table, "column-name", lam(n :: Number): __ end)

#ex: filter-with(flights, lam(r :: Row): r["distance"] >= 1500 end)
#ex: filter-with(flights, is-long-flight)