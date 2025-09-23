use context starter2024
check:
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
  if temp-in-C > 27:
    "sun hat"
  else:
    "no hat"
  end
where:
  choose-hat(25) is "no hat"
  choose-hat(32) is "sun hat"
  choose-hat(27) is "sun hat"
end