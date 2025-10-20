use context dcic2024

fun kilo-to-mile(m :: Number) -> Number:
  doc: "convert kilometers to miles"
  m / 1.6
where: 
  kilo-to-mile(100) is 62.5
  kilo-to-mile(250) is 156.25
end

fun air-quality(n :: Number) -> String: 
  doc: 'take a given value and return a air quality string based on the value'
  if (n >= 0) and (n <= 50): 'Good'
  else if (n >= 51) and (n <= 100): 'Moderate'
  else if (n >= 101) and (n <= 150): 'Unhealthy'
  else: 'Hazardous'
  end
where: 
  air-quality(0) is 'Good'
  air-quality(100) is 'Moderate'
  air-quality(126) is 'Unhealthy'
  air-quality(199) is 'Hazardous'
end
