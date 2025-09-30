use context dcic2024

#1 
fun leap-year(year :: Number) -> Boolean:
  doc: "determine if year is a leap year or not, return True if so, return False if not"
  #all leap years divisible by 4
  if (num-modulo(year, 4) == 0) and (not(equal-now(num-modulo(year, 100), 0))): 
    true
  #leap years in the hundreds are divisible by both by 100 and 400 without leaving a remainder 
  else if (num-modulo(year, 4) == 0) and (equal-now(num-modulo(year, 100), 0)):
    if num-modulo(year, 400) == 0: 
      true
    else: 
      false
    end # end of if num-modulo(year, 400) == 0:
  else:
    false
  end #end of if, else if, and else
where: 
  leap-year(2016) is true
  leap-year(2017) is false
end #end of fun leap-year



#2
fun tick(sec :: Number) -> Number:
  doc: "Operate like a normal clock with the input returning the second that comes after it, the seconds range goes from 0 to 59. Minute isn't being used so everytime it reaches a minute the count returns back to 0"
  if sec <= 58:
    sec + 1
  else: 
    sec - 59 #resets back to 0 in the case sec is 59
  end #end of if/else
where: 
  tick(27) is 28
  tick(59) is 0
end #end of fun tick  


    
#3 
fun rock-paper-scissors(player1 :: String, player2 :: String) -> String:
  doc: "find the winner of a rock paper scissors game or find the game is tied"
  
  ask:
    | (player1 == "rock") and (player2 == "rock") then: "tie"
    | (player1 == "paper") and (player2 == "paper") then: "tie"
    | (player1 == "scissors") and (player2 == "scissors") then: "tie"
      #end of tie
    | (player1 == "rock") and (player2 == "scissors") then: "player 1 wins"
    | (player1 == "paper") and (player2 == "rock") then: "player 1 wins"
    | (player1 == "scissors") and (player2 == "paper") then: "player 1 wins"
      #end of player1 wins
    | (player2 == "rock") and (player1 == "scissors") then: "player 2 wins"
    | (player2 == "paper") and (player1 == "rock") then: "player 2 wins"
    | (player2 == "scissors") and (player1 == "paper") then: "player 2 wins"
      #end of player2 wins
    | otherwise: "invalid choice"
  end
  
  #player 2 wins 
where: 
  rock-paper-scissors("rock", "rock") is "tie"
  rock-paper-scissors("rock", "scissors") is "player 1 wins"
  rock-paper-scissors("jack", "queen") is "invalid choice"
end #end of fun tick  