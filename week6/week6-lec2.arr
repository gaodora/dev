use context dcic2024
dummy-list = [list: 1, 2, 3, 4]
dummy-list

dummy-list.first #get fist value of list 
dummy-list1 = dummy-list.rest #get the rest of the values in list
dummy-list1
dummy-list2 = dummy-list1.rest
dummy-list2
dummy-list2.first 


[list: 7, 8, 9, 10, 11, 12].length()

fun my-len(l):
  cases(List) l: 
    | empty => 0
    | link(f, r) => 1 + my-len(r)
  end
where: 
  my-len([list: 7,8,9]) is 3
  my-len([list: 8, 9]) is 2
  my-len([list: 9]) is 1
  my-len([list: ]) is 0
  
  my-len([list: 55, 56, 57, 58]) is 1 + my-len([list: 56, 57, 58]) #1+3
  my-len([list: 55, 56, 57, 58]) is 2 + my-len([list: 56, 57, 58].rest) #2+2
end


#for example
#function to find a max value
#concrete list [list: 3, 7, 2, 9, 1]
fun max(l):
  doc: "find the max number of the list"
  cases(List) l:
    | empty => -99
    | link(f, r) => num-max(f, max(r))
  end
where: 
  max([list: 3, 5, 7, 9, 1]) is 9
  max([list: ]) is -99
  max([list: -1, 0, 4]) is 4
  max([list: -1, -2, -3]) is -1
end

max([list: ])


#CLASS EXERCISES
hello = [list: "Hello", "World", "!"]

#teach did it and it worked 
fun round-num(l :: List<Number>) -> List<Number>:
  doc: "round each decimal number in a list to nearest int"
  cases(List) l: 
    | empty => empty
    | link(f, r) => link(round-num(f), round-num(r))
  end
where: 
  round-num([list: 2.6, 3.4, 9.2]) is [list: 3, 3, 9]
end 

#teach did it and it worked too 
fun string-concat(l):
  doc: "concentrates all strings in a list into a single string"
  
  cases (List) l:
    | empty => ""
    | link(f,r) => f + string-concat(r)
  end
  
where: 
  string-concat([list: "Hello", "World", "!"]) is "Hello World!"
  
end