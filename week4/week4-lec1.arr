use context dcic2024
include csv
#create table
orders = table: time, amount
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

orders

#filtering rows in a table
high-value-orders = table: time, amount
  row: "08:00", 10.50
  row: "10:15", 8.00
end


#function over rows
fun is-high-value(o :: Row) -> Boolean:
  o["amount"] >= 8.0
where:  
  is-high-value(orders.row-n(2)) is true
  is-high-value(orders.row-n(3)) is false
end

new-high-orders = filter-with(orders, is-high-value)

check:
  new-high-orders is high-value-orders
end


#Unnamed (λ lambda) Functions
filter-with(orders, lam(u): u["amount"] >= 8.0 end)






#Class Ex
#task 1 - ordering and filtering
#is-morning
filter-with(orders, lam(u): u['time'] < "12:00" end)

#create new table that sorts by time 
sorted = order-by(orders, 'amount', true) 
#code to extract the amount of the latest morning order
order-by(orders, 'time', true).row-n(3)['amount']



#task 2 - loading data
#loads table
photos = load-table:
  Location :: String,
  Subject :: String,
  Date :: String 
  source:csv-table-url("https://pdi.run/f25-2000-photos.csv", default-options)
end

photos

#filter for subject 'forest' and creates new table
filter-with(photos, lam(u): u['Subject'] == "Forest" end)

#counts location
location-counts = count(photos, "Location")
location-counts

#frequency bar
freq-bar-chart(photos, "Location")

#alsocounts location
location-counts-sorted = location-counts.order-by("count", true)
location-counts-sorted

