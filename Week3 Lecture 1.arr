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
    | temp-in-C < 10 then: "winter hat"
    | otherwise: "no hat" 
  end #end ask expression
end #end fun ask_hat

ask_hat(15) 




fun add-glasses(the-fit): # String -> String 
  doc: "takes in outfit and adds glasses to what will be worn"
  ask: 
    | the-fit == "sun hat" then: "sun glasses"
    | the-fit == "winter hat" then: "goggles"
    | otherwise: "no glasses"
  end #end ask expression
end #end fun 

add-glasses("sun hat")
add-glasses(ask_hat(4))




fun choose-outfit(temp-in-C): #int -> String
  doc: "choose the outfit based on temp and call hat and glasses fun" 
  if temp-in-C > 27:
    "wear short clothing, a " + ask_hat(temp-in-C) + ", and " + add-glasses(ask_hat(temp-in-C))
  else if temp-in-C < 10: 
    "wear long and thick clothing, a " + ask_hat(temp-in-C) + ", and " + add-glasses(ask_hat(temp-in-C))
  else:
    "weather is good, wear casual clothing, " + ask_hat(temp-in-C) + ", and " + add-glasses(ask_hat(temp-in-C))
  end #end if condition 
end #end choose-outfit

choose-outfit(12) #casual day 
choose-outfit(30) #hot day
choose-outfit(4) #cold day




fun choose-hat-or-visor(temp-in-C, has-visor): # int, boolean -> String
  doc: "determine whether to wear a hat or a visor based on temp and if person owns a visor"
  ask:
    | (temp-in-C > 30) and (true) then: "wear visors and " + ask_hat(temp-in-C)
    | (temp-in-C > 30) and (false) then: "wear sunglasses and " + ask_hat(temp-in-C) 
    | otherwise: ask_hat(temp-in-C) + " and don't wear your visors"
    
      #|
    | (temp-in-C < 10) and (true) then: "don't wear the visor and also" + ask_hat(temp-in-C)
    | (temp-in-C < 10) and (false) then: "wear sunglasses and " + ask_hat(temp-in-C)
      |#
      
  end #ends ask
end #end of choosehat or visor

choose-hat-or-visor(30, true)  
choose-hat-or-visor(31, true) 
choose-hat-or-visor(31, false) 
choose-hat-or-visor(10, true) 
choose-hat-or-visor(5, false) 

