use context starter2024
check: #ex of check function 
  true is true
  not(true) is false
  
  # and
  true and true is true
  false and true is false
  (4 < 5) and ((4 + 2) == 6) is true
  
  # or
  true or false is true
  false or false is false
  (4 > 5) or ("a" == "b") is false
end


fun choose-hat(temp-in-C :: Number) -> String:
  doc: "determines appropriate head gear, with above 27C a sun hat, below nothing"
  spy: #look at true/false
    temp-in-C,
    comparison: temp-in-C > 27
  end  
  
  if temp-in-C > 27:
    "Wear sun hat while going out today!"
  else if temp-in-C < 10: 
    "Today is cold, wear a winter hat when going out."
  else:
    "The weather is good, you don't need a hat today!"
  end #end if condition 
end #end fun choose-hat

choose-hat(10)




fun ask_hat(temp-in-C): #int input -> String output
  doc: "determine appropriate head gear using ask"
  
  ask: 
    | temp-in-C > 27 then: "sun hat"
    | temp-in-C < 10 then: "winter had"
    | otherwise: "no hat" 
  end #end ask expression
end #end fun ask_hat

ask_hat(15) 




fun add-glasses(the-fit): # String -> String 
  doc: "takes in outfit and adds glasses to what will be worn"
end #end fun add-glasses 