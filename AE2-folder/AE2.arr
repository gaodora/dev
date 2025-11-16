use context dcic2024
include csv
include data-source
include tables


penguins = load-table: 
  num :: String, 
  species :: String,
  island :: String,
  bill-length-mm :: Number, 
  bill-depth-mm :: Number,
  flipper-length-mm :: Number,
  body-mass-g :: Number,
  sex :: String, 
  year :: Number
  
  source: csv-table-file("penguins.csv", default-options)
end

#print penguins to get an idea of the table and table content
penguins



#Question 1: What is the ratio 
#What is the ratio of a penguin's bill length to bill depth?
fun bill-to-length(r :: Row) -> Number: 
  doc: "return the ratio of a penguin's bill length to its bill depth"
  leng = string-to-number(r["bill-length-mm"]).value
  dep = string-to-number(r["bill-depth-mm"]).value
  to-round = leng / dep
  num-round(to-round, 2)
where: 
  bill-to-length(penguins.row-n(0)) is 2.09
end