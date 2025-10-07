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
undecided-voters

#creates frequency chart of table
freq-bar-chart(undecided-voters, "Party")

#class exercises 
fun normalize-date(st :: String) -> String:
  doc: "orders DOB from D-M-Y to Y-M-D"
  day = string-substring(st,0,2)
  month = string-substring(st,3,5)
  year = string-substring(st,6,9)
  sv = (year + "-" + month + "-" + day)
where: 
    normalize-date("23/09/1985") is "1985-09-23"
end

