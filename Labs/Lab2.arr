import file("lab2-support.arr") as support

"1..."
#basic word to test
support.encryptor1("hello")
#tests how the encryptor responds to to a word being spelled on repeat with a space between words
support.encryptor1("jaffa jaffa") 
#noticed encryptor1 is repeating words, the period helps identify how many times a word is being repeated
support.encryptor1("cats.") 

#recreation of encryptor1
fun my-encryptor1(s :: String) -> String: 
  doc: "returns string with it duplicated 5 times" 
  string-repeat(s, 5)
end
#test my fun 1
support.test-encryptor1(my-encryptor1)



"2..."
#basic word to test
support.encryptor2("hello")
#tests how the encryptor responds to to a word being spelled on repeat with a space between words
support.encryptor2("jaffa jaffa jaffa")
#testing response to four letter words and to words with less than 4 letters with "cat" given how encryptor2 is cutting off words at four for words with more than 4 letters the result was that this encryptor requires a word to have at least 4 letters 
support.encryptor2("cats") 

#recreation of encryptor2
fun my-encryptor2(s :: String) -> String:
  doc: "returns string with only four letters"
  string-substring(s, 0, 4)
end
#test my fun 2
support.test-encryptor2(my-encryptor2)



"3..."
#basic word to test
support.encryptor3("hello")
#tests how the encryptor responds to to a word being spelled on repeat with a space between words
support.encryptor3("jaffa jaffa jaffa")
#testing response to quotation ".", encryptor3 changes it to "!"
support.encryptor3("cats.") 
#testing response to quotation "?", no changes
support.encryptor3("cats?") 

#recreation of encryptor3
fun my-encryptor3(s :: String) -> String:
  doc: "returns strings that have a '.' with an '!'"
  string-replace(s, ".", "!")
end
#test my fun 3
support.test-encryptor3(my-encryptor3)



"4..." 
#basic word to test
support.encryptor4("hello")
#tests how the encryptor responds to to a word being spelled on repeat with a space between words
support.encryptor4("jaffa jaffa jaffa")
#testing response to 4 letter strings, found that any less than 4 words will produce an error
support.encryptor4("cat.")

#recreation of encryptor4
fun my-encryptor4(s :: String) -> String:
  doc: "returns strings cut off at 4 letters and duplicated 5 times"
  stp1 = string-substring(s, 0, 4)
  string-repeat(stp1, 5)
end
#test my fun 4
support.test-encryptor4(my-encryptor4)



"5..." #TAKE ANOTHER LOOK AT IT 
#basic word to test
support.encryptor5("hello")
#tests how the encryptor responds to to a word being spelled on repeat with a space between words
support.encryptor5("jaffa jaffa jaffa")
#testing response to string with quotation
support.encryptor5("cat.")
#testing response to capitalization
support.encryptor6("CAE")
#testing with another word
support.encryptor5("seal")
#testing with the vowels
support.encryptor5("Aa Ee Ii Oo Uu")


fun my-encryptor5(s :: String) -> String:
  doc: "Replace vowels (aAeEiIoOuU) with next letter"
  fun bump-vowel(c :: String): 
    if c == "A": "B" else: 
      if c == "E": "F" else:
        if c == "I": "J" else:
          if c == "O": "P" else:
            if c == "U": "V" else:
              if c == "a": "b" else: 
                if c == "e": "f" else:
                  if c == "i": "j" else:
                    if c == "o": "p" else:
                      if c == "u": "v" else:
    c end end end end end end end end end end 
    end #end of bumpvowel
  fun go(i :: Number, acc :: String):
    if i >= string-length(s): acc
   #append converted character at index i, then move to i + 1
    else: go(i + 1, acc + bump-vowel(string-char-at(s,i)))
    end #end of if
  end #end of fun go
  go(0, "") #start from index 0 with empt accumulator. return the final string 
end
#test my fun 5
support.test-encryptor5(my-encryptor5) 



"6..." 
#basic word to test
support.encryptor6("hello")
#tests how the encryptor responds to to a word being spelled on repeat with a space between words
support.encryptor6("jaffa jaffa jaffa")
#testing response to string with quotation
support.encryptor6("cat.")
#testing response to capitalization
support.encryptor6("CAT")

#recreation of encryptor6
fun my-encryptor6(s :: String) -> String:
  doc: "convert capital letters into lower case and remove r"
  stp2 = string-to-lower(s)
  string-replace(stp2, "r", "")
end
#test my fun 6
support.test-encryptor6(my-encryptor6)



"7..." 
#basic word to test
support.encryptor7("hello")

#recreation of encryptor7
fun my-encryptor7(s :: String) -> Number:
  doc: "find string length"
  string-length(s)
end
#test my fun 7
support.test-encryptor7(my-encryptor7)




"8..."
#basic word to test
support.encryptor8("hello")
#tests how the encryptor responds to to a word being spelled on repeat with a space between words
support.encryptor8("hello hello hello")
#testing response to string with quotation
support.encryptor8("cat.")

#recreation of encryptor9
fun my-encryptor8(s :: String) -> String:
  doc: "add '!!!' to string and return string with '!!!' 3 times"
  stp4 = string-append(s, "!!!")
  string-repeat(stp4, 3)
end
#test my fun 8
support.test-encryptor8(my-encryptor8)



"9..." 
#basic word to test
support.encryptor8("hello")
#recreation of encryptor9
fun my-encryptor9(s :: String):
  doc: "finde code-point"
  string-to-code-point(string-substring(s, 0, 1))
end
#test my fun 9
support.test-encryptor9(my-encryptor9)



"10..."
#basic word to test
support.encryptor8("hello")

fun my-encryptor10(s :: String): 
  doc: "removes all 'r's (both upper and lower), makes string lowercases and prints only the first four characters of the string, then repeat 5 times"
  block: 
    my-encryptor1(my-encryptor2(my-encryptor6(my-encryptor5(s))))
  end 
end

support.test-encryptor10(my-encryptor10)