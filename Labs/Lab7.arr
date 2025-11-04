use context dcic2024

data SensorNet: 
  | hub(bandwidth :: Number, left :: SensorNet, right :: SensorNet)
  | sensor(rate :: Number)
end

#examble network
sA = sensor(60)
sB = sensor(120)
sC = sensor(45)

#larger network 
hub1 = hub(150, sA, sB)
core = hub(200, hub1, sC)
core2 = hub(225, hub1, sC)

#          hub(200)
#          /     \
#   hub(150)       sensor(45)
#     /     \
#sensor(60)  sensor(120)


#TASK 1
fun total-load(n :: SensorNet) -> Number: 
  doc: 'returns the total load or the sum of all sensor rates in the network'
  cases(SensorNet) n: 
    | hub(bandwidth, left, right) => total-load(left) + total-load(right)
    | sensor(r) => r 
  end
where: 
  total-load(sA) is 60
  total-load(hub1) is 60 + 120
  total-load(core) is 225
end 
#end of fun total-load


#TASK 2
fun fits-capacities(n :: SensorNet) -> Boolean: 
  doc: "returns boolean, true if every hub's bandwitdth is as large as the total load of its left and right, false otherwise"
  cases(SensorNet) n: 
    | hub(bandwidth, left, right) => 
      if (total-load(n) <= bandwidth): true
      else: false
      end
    | sensor(r) => false 
  end
where: 
  fits-capacities(core2) is true
  fits-capacities(hub1) is false
end 
#end of fun total-load


#TASK 3
fun deepest-depth(n :: SensorNet) -> Number: 
  doc: 'returns the depth of the deepest sensor'
  cases(SensorNet) n: 
    | hub(bandwidth, left, right) => 
      1 + num-max(deepest-depth(left), deepest-depth(right))
    | sensor(r) => 0
  end
where: 
  deepest-depth(core) is 2
  deepest-depth(hub1) is 1
  deepest-depth(sB) is 0
end
#end of fun deepest-depth


#TASK 4
fun apply-scale(n :: SensorNet, s :: Number) -> SensorNet: 
  doc: 'applies given scaling facot s to all sensor rates, returning new scaled network, new sensor rate divided by s'
  cases(SensorNet) n: 
    | hub(bandwidth, left, right) => hub(bandwidth, apply-scale(left, s), apply-scale(right, s))
    | sensor(r) => sensor(r / s)
  end
where: 
  apply-scale(hub1, 2) is hub(150, sensor(30), sensor(60))
  apply-scale(core, 10) is hub(200, hub(150, sensor(6), sensor(12)), sensor(4.5))
end 
#end of apply-scale


fun needed-scale(n :: SensorNet) -> Number: 
  cases(SensorNet) n: 
    | sensor(r) => 1
    | hub(bandwidth, left, right) => 
      block: 
        load = total-load(left) + total-load(right)
        here = load / bandwidth
        num-max(num-max(here, needed-scale(left)), needed-scale(right))
      end
  end
where: 
  # For 'core': max(225/200 = 1.125, hub1: 180/150 = 1.2) = 1.2
  needed-scale(core) is 1.2
end 
#end of needed-scale


