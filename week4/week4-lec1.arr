use context dcic2024

orders = table: time, amount
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end


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
#task 1
#filter-with(orders, lam(u): u['time'] < "12:00" end)
fun is-morning(p :: Row) 
  filter-with(orders, lam(p): p['time'] < "12:00" end)
end

#task 2

