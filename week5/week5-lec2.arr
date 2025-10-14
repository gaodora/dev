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
#---------------------------------
#CLASS EXERCISES

"LIST OPERATIONS"
"1"
discount-codes-ce = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]
discount-codes-ce

#make everything upper-case
upper-codes-ce = map(string-to-upper, discount-codes-ce)
upper-codes-ce
#another method of making upper 

#takes out duplicates
unique-codes-ce = distinct(discount-codes)
unique-codes-ce

#if you did upper-case conversion after distict() you would still have NONE and none still in the list of unique codes

"2"
survey-respon = [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]
survey-respon

#make elements of survey response lower-case
lower-survey = map(string-to-lower, survey-respon)
lower-survey

#takes out duplicates 
unique-survey = distinct(lower-survey)
unique-survey

#filter out maybe 
definitive-respon = filter(lam(s): s <> "maybe" end, unique-survey)
definitive-respon

#---------------------------------
"LOOPS"
loops-list = ([list: 0, 1, 2, 3])
"1"
#define product calculating function 
fun mult(num-list :: List<Number>) -> Number block:
  doc: "multiplies all numbers in a list together"
  var result = 1
  for each(n from num-list):
    result := result * n
  end 
  result
end
mult(loops-list)

#define function sum-even-num and adds only even numbers 
fun sum-even-num(num-list :: List<Number>):
  doc: "adds only the even numbers of a list to get a sum"
  var even-sum = 0
  for each(n from num-list):
    if (num-modulo(n, 2) == 0) block:
      even-sum := even-sum + n
    else:
      even-sum := even-sum + 0
    end
  end
  even-sum
  endci
sum-even-num(loops-list)

"2"
#define function my-length and returns the number of elements in list
fun my-length(num-list :: List<Number>) -> Number block:
  doc: "finds length of list by adding 1 to length everytime an element is counted"
  var list-length = 0
  for each(n from num-list):
    list-length := length + 1
  end
  list-length
end 

"3"
#fun my-doubles where elements twice the og are returned
fun my-doubles(num-list :: List<Number>) -> Number block:
  doc: "doubles the elements of a given list"
  var new-num-list = ([list: ])
  for each(n from num-list):
    var element = n * 2
    new-num-list := new-num-list.append(element)
  end
end 

"4"
#fun my-doubles where elements twice the og are returned with list map
fun my-doubles-map(num-list :: List<Number>) -> Number block:
  doc: "doubles the elements of a given list"
  num-list.map(lam(n): n * 2 end)
  num-list
end 
