use context starter2024

#1 Design a function to determine if a given year is a leap year. The function should return true if the year is a leap year, otherwise false. Follow the design process, start with a contract, include types, then write the doc string and tests inside a where block.
fun leap-year(year :: Number) -> Boolean:
  doc: "determine if year is a leap year or not, return True if so, return False if not"
  num-modulo(year, 4) == 0 
  #num-modulo(year, 400) = 0 

where: 
  leap-year(2016) is true
  leap-year(2017) is false
end #end of fun leap-year


fun is-even(n :: Number) -> Boolean:
  num-modulo(n, 2) == 0
where:
  is-even(6) is true
  is-even(3) is false
end
