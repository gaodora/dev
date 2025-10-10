use context dcic2024
import math as M
import statistics as S
#import of two libraries

cafe-data =
  table: day, drinks-sold
    row: "Mon", 45
    row: "Tue", 30
    row: "Wed", 55
    row: "Thu", 40
    row: "Fri", 60
  end

#a column is a type of list 
sales = cafe-data.get-column("drinks-sold")

sample-list = [list: 4,5,3,2,6,7]
sample-list

empty-list = [list: ]
empty-list

#---------------------------------
#calc max, min, mean, and sum of all the drinks sold
max = M.max(sales)
max

min = M.min(sales)
min

sales-mean = S.mean(sales)
sales-mean

total-sum = M.sum(sales)
total-sum

#multiply all numbers together; [list: 2,3,4] = 2x3x4 = 24
fun compute-product(num-list :: List<Number>) -> Number block:
  doc: "multiplies all numbers in a list together"
  var result = 1
  for each(n from num-list):
    result := result * n
  end 
  result
where: 
  compute-product([list: 2,3,4]) is 24
  compute-product([list: 6,5,2]) is 60
end
product = compute-product(sales)
product


#---------------------------------
discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]
discount-codes

#what are the distinct codes
unique-codes = distinct(discount-codes)
unique-codes

#filter out codes with no discount
fun is-real-code(code :: String) -> Boolean:
  not(string-to-lower(code) == "none")
end

real-codes = filter(is-real-code, unique-codes)
real-codes

first-code = real-codes.get(0)
first-code

lower-codes = map(string-to-lower, real-codes)
lower-codes

#---------------------------------
var total = 1
total := total + 10
total
# 11

#---------------------------------
fun my-sum(num-list :: List) -> Number block:
  var totals = 0
  for each(n from num-list):
    totals := totals + n
  end
  totals
where:
  my-sum([list: 0, 1, 2, 3]) is 6
end

#---------------------------------
