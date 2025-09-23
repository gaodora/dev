use context dcic2024
provide *
provide-types *

import js-file("lab2-compiled") as hidden

#| ENCRYPTORS |#

fun encryptor1(s :: String) -> String:
  hidden.encryptor3(s)
end

fun encryptor2(s :: String) -> String:
  hidden.encryptor2(s)
end

fun encryptor3(s :: String) -> String:
  hidden.encryptor1(s)
end

fun encryptor4(s :: String) -> String:
  hidden.encryptor4(s)
end

fun encryptor5(s :: String) -> String:
  hidden.encryptor5(s)
end

fun encryptor6(s :: String) -> String:
  hidden.encryptor6(s)
end

fun encryptor7(s :: String) -> Number:
  hidden.encryptor9(s)
end

fun encryptor8(s :: String) -> String:
  hidden.encryptor8(s)
end

fun encryptor9(s :: String) -> Number:
  hidden.encryptor7(s)
end

fun encryptor10(s :: String) -> String:
  hidden.encryptor10(s)
end

#| TEST ENCRYPTORS |#

fun test-encryptor1(encryptor :: (String -> String)) -> String:
  hidden.test-encryptor3(encryptor)
where:
  test-encryptor1(encryptor1) is "4/4 tests passed!"
end

fun test-encryptor2(encryptor :: (String -> String)) -> String:
  hidden.test-encryptor2(encryptor)
where:
  test-encryptor2(encryptor2) is "4/4 tests passed!"
end

fun test-encryptor3(encryptor :: (String -> String)):
  hidden.test-encryptor1(encryptor)
where:
  test-encryptor3(encryptor3) is "5/5 tests passed!"
end

fun test-encryptor4(encryptor :: (String -> String)):
  hidden.test-encryptor4(encryptor)
where:
  test-encryptor4(encryptor4) is "5/5 tests passed!"
end

fun test-encryptor5(encryptor :: (String -> String)):
  hidden.test-encryptor5(encryptor)
where:
  test-encryptor5(encryptor5) is "11/11 tests passed!"
end

fun test-encryptor6(encryptor :: (String -> String)):
  hidden.test-encryptor6(encryptor)
where:
  test-encryptor6(encryptor6) is "9/9 tests passed!"
end

fun test-encryptor7(encryptor :: (String -> Number)):
  hidden.test-encryptor9(encryptor)
where:
  test-encryptor7(encryptor7) is "3/3 tests passed!"
end

fun test-encryptor8(encryptor :: (String -> String)):
  hidden.test-encryptor8(encryptor)
where:
  test-encryptor8(encryptor8) is "6/6 tests passed!"
end

fun test-encryptor9(encryptor :: (String-> String)):
  hidden.test-encryptor7(encryptor)
where:
  test-encryptor9(encryptor9) is "6/6 tests passed!"
end

fun test-encryptor10(encryptor :: (String-> String)):
  hidden.test-encryptor10(encryptor)
where:
  test-encryptor10(encryptor10) is "3/3 tests passed!"
end

  
  
  
  
  
  
  
