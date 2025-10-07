use context dcic2024

include csv

voter-data =
  load-table: VoterID,DOB,Party,Address,City,County,Postcode
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/voters.csv", default-options)
end

voter-data


filter-with(voter-data, lam(r): r["Party"] == "Labour" end).length()
# should display 4

voter-data.row-n(3)["Party"]
# should display "Labuor"

#puts 'Undecided' for empty "" strings
fun blank-to-undecided(s :: String) -> String:
  doc: "replaces an empty string with Undecided"
  if s == "":
    "Undecided"
  else:
    s
  end
where:
  blank-to-undecided("") is "Undecided"
  blank-to-undecided("blah") is "blah"
end

undecided-voters = transform-column(voter-data, "Party", blank-to-undecided)

#creates frequency chart of table
freq-bar-chart(undecided-voters, "Party")



#class exercises 
fun normize-date(r :: row): 
  doc: "normallizes date to from DD/MM/YYYY to YYYY-MM-DD"
  #get the date based on row and column 'date'
  #extract the numbers and use '-' and "/" to differentiate or use the placement of it ie 2 and 5
  # have string day, month, year
  #order it to print year - month - day
  
end #end of function normize-date