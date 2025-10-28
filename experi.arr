use context dcic2024

fun kilo-to-mile(m :: Number) -> Number:
  doc: "convert kilometers to miles"
  m / 1.6
where: 
  kilo-to-mile(100) is 62.5
  kilo-to-mile(250) is 156.25
end

fun air-quality(n :: Number) -> String: 
  doc: 'take a given value and return a air quality string based on the value'
  if (n >= 0) and (n <= 50): 'Good'
  else if (n >= 51) and (n <= 100): 'Moderate'
  else if (n >= 101) and (n <= 150): 'Unhealthy'
  else: 'Hazardous'
  end
where: 
  air-quality(0) is 'Good'
  air-quality(100) is 'Moderate'
  air-quality(126) is 'Unhealthy'
  air-quality(199) is 'Hazardous'
end


# Example table with a subject column
my-table = table: subject, grade, hours
  row: "Forest", "A", 5
  row: "Ocean", "B", 3
  row: "Forest", "A+", 7
  row: "Desert", "C", 2
  row: "Forest", "B", 4
end

# Filter rows where subject is "Forest"
forest-rows = filter-with(my-table, lam(row): row["subject"] == "Forest" end)

forest-rows




basket = table: item :: String, price :: Number, quantity :: Number
  row: "apple", 0.50, 10
  row: "orange", 0.75, 5
  row: "watermelon", 2.99, 2
end

fun add-total(t :: Table) -> Table:
  doc: "Adds a total column calculated as price * quantity"
  build-column(t, "total", lam(row): row["price"] * row["quantity"] end)
end

# Create the table with totals
basket-with-totals = add-total(basket)

basket-with-totals

new-sorted-total = order-by(basket-with-totals, "total", false)
new-sorted-total
max = new-sorted-total.row-n(0)
max
