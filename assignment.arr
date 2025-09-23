import file("lab2-support.arr") as support

"1..."
support.encryptor1("hello") #basic word to test
support.encryptor1("jaffa jaffa") #tests how the encryptor responds to to a word being spelled on repeat with a space between words
support.encryptor1("cats.") #noticed encryptor1 is repeating words, the period helps identify how many times a word is being repeated

#recreation of fun encryptor1 
fun my-encryptor1(s :: String) -> String: 
  string-repeat(s, 5)
end

support.test-encryptor1(my-encryptor1)


"2..."
support.encryptor2("hello")
support.encryptor2("jaffa jaffa jaffa")
support.encryptor2("cats.")
support.encryptor2("cats cats cats")

