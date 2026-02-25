identify_even_odd <- function(number, label) {
  
  if (number != floor(number)) {
    return("Error: Decimal numbers are not accepted. Please input an integer.")
  }
  
  if (number %% 2 == 0) {
    result_message <- paste(label, "is Even")
  } else {
    result_message <- paste(label, "is Odd")
  }
  
  return(result_message)
}

print(identify_even_odd(7, "Input Number"))

print(identify_even_odd(10, "Even Number Test"))

print(identify_even_odd(-3, "Negative Odd Number"))

print(identify_even_odd(-8, "Negative Even Number"))

print(identify_even_odd(0, "The Number Zero"))

print(identify_even_odd(4.5, "Decimal Number"))

print(identify_even_odd(-2.7, "Another Decimal Test"))
