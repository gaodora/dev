import file("lab2-support.arr") as support

"1..."
#basic word to test
support.encryptor1("hello")
#tests how the encryptor responds to to a word being spelled on repeat with a space between words
support.encryptor1("jaffa jaffa") 
#noticed encryptor1 is repeating words, the period helps identify how many times a word is being repeated
support.encryptor1("cats.") 

#recreation of fun encryptor1 
fun my-encryptor1(s :: String) -> String: 
  string-repeat(s, 5)
end

support.test-encryptor1(my-encryptor1)


"2..."
#basic word to test
support.encryptor2("hello")
support.encryptor2("jaffa jaffa jaffa") #tests how the encryptor responds to to a word being spelled on repeat with a space between words
support.encryptor2("cats") #testing response to four letter words and to words with less than 4 letters with "cat" given how encryptor2 is cutting off words at four for words with more than 4 letters the result was that this encryptor requires 

