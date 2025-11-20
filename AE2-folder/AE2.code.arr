use context dcic2024
include csv
include data-source
include tables



penguins = load-table: penguin-num, species, island, bill-length-mm, bill-depth-mm, flipper-length-mm, body-mass-g, sex, year
  
  source: csv-table-file("penguins.csv", default-options)
  sanitize penguin-num using string-sanitizer 
  sanitize species using string-sanitizer 
  sanitize island using string-sanitizer 
  sanitize bill-length-mm using num-sanitizer 
  sanitize bill-depth-mm using num-sanitizer 
  sanitize flipper-length-mm using num-sanitizer 
  sanitize body-mass-g using num-sanitizer 
  sanitize sex using string-sanitizer 
  sanitize year using num-sanitizer 
end

#print penguins to get an idea of the table and table content
penguins



#Scalar - Question 1: What is the ratio 
# What is the ratio of a penguin's bill length to bill depth?
###########################
#fun that returns the ratio bill length/depth
fun bill-to-length(r :: Row) -> Number: 
  doc: "return the ratio of a penguin's bill length to its bill depth"
  to-round = r["bill-length-mm"] / r["bill-depth-mm"]
  num-round(to-round * 100) / 100 #multiply by 100 to get the two decimal places forward then after rounding we divide so we get a number of if we rounded to the hundredths place
where: 
  #checks that the function is correct
  bill-to-length(penguins.row-n(0)) is 2.09
end



#Question 2 - Transformation
# Convert the penguin's body mass in gram to kilogram
##########################
#renames the column from g to kg because it is being converted into kilograms
penguins-renam = penguins.rename-column("body-mass-g", " ")
#converts every value in the table into kilograms using .transform-column()
penguins-kg = penguins-renam.transform-column("body-mass-kg", lam(row): row * 0.001 end)
'prints out the table to ensure it is correct, penguins-kg'
penguins-kg



#Question 3 - Selection 
# Which of the penguins weigh 4000 or more grams? 
#######################
#filter() filters for penguins >= 4000 using lambda, creating a table
heavy-penguins = penguins.filter(lam(row): row["body-mass-g"] >= 4000 end)


#makes a list from inputted table
heavy-pen-lis = heavy-penguins.all-rows()
#prints the list
'heavy-pen-lis'
heavy-pen-lis



#Question 4 - Accumulation 
# What is the average flipper length in milimeters?
#####################
#extract flipper-length-mm as a list
flipper-length-list = penguins.get-column("flipper-length-mm")
flipper-length-list

#flipper length - the number of penguins
num-peng = flipper-length-list.length()
num-peng

#total from the flipper length list that will hold the total flipper lengths of all penguins
var list-total = 0

#for each loop that adds all of the list's values into list-total
for each(flipper from flipper-length-list):
  list-total := list-total + flipper
end 

#calculate average by dividing the total flipper length by the number of penguins
average = list-total / num-peng

#prints out the average
"the average in milimeters"
average