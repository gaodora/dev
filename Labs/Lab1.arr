use context starter2024

#1. T-Shirt Shop
#expression for 5 identical T-shirts assuming that each shirt itself will be charged £12 and have a setup fee of £3
5 * (12 - 3)
#expression for 7 identical T-shirts assuming that each shirt itself will be charged £12 and have a setup fee of £3
7 * (12 - 3)
#comparing the two results
"45 < 63 is " 
45 < 63 

#perimeter of rectangle poster
p = 2 * (420 + 594)
p * 0.10 
#alt perimeter calculation
(2 * (420 + 594)) * 0.10
#if you forget parentheses around (width + height) you will get an error because pyret doesn't follow the order of operations for multiplication and division


#2. String Surprises
#missing one of the quotes and fix the error, when a quote is missing you will get an error 
"Designs for everyone!"

# what if you try to + strings, it will print both strings combined (without a space unless it's included in one of the origninal strings 
"red" + "blue"
#Reflect 1 + "blue": results in an error and can't be printed, it would work if you made 1 a string and at that point it would return "1blue"
"1" + "blue"


#3. Make a Traffic Light
body = rectangle(80, 200, "solid", "black")
c_red = circle(25, "solid", "red")
c_yellow = circle(25, "solid", "yellow")
c_green = circle(25, "solid", "green")
pole = rectangle(15, 150, "solid", "black")

a = overlay-align("center", "top", c_red, body) #overlay red light on the black body
b = overlay-align("center", "middle", c_yellow, a) #overlay yellow light over red light and black body
c = overlay-align("center", "bottom", c_green, b) #overlay green light over yellow light, red light, and black body
above-align("center", c, pole) #aligns the pole for the traffic light

#2nd method of aligning the lights 
lights = above(c_red, above(c_yellow, c_green))
overlay-align("center", "center", lights, body)

#3rd method of aligning the lights
one = overlay-xy(c_red, -15, -10, body)
two = overlay-xy(c_yellow, -15, -75, one)
three = overlay-xy(c_green, -15, -140, two)
three


#4. Broken Code Hunt
# Goal: A rectangle with width 50 and height 20, solid black, the error was that the order height and opacity was incorrect
rectangle(50, 20, "solid", "black")
#solid was not in quotes, resulting in an error
circle(30, "solid" , "red")

#5. Create a Flag or Shield
#FLag: creates the shapes that will form the flag
base = rectangle(200, 140, "solid", "white")
red1 = rectangle(200, 55, "solid", "red")
red2 = rectangle(200, 55, "solid", "red")
ca = circle(40, "solid", "red")
cb = circle(55, "solid", "white")

#overlays that will make the form of the flag
overcircle = overlay(ca, cb)
over1 = overlay-align("center", "top", red1, base)
over2 = overlay-align("center", "bottom", red2, over1)
over3 = overlay-align("center", "middle", overcircle, over2)
#displays flag
over3

#sheild variation
base_sheild = square(100, "solid", "blue")
squ = square(70, "solid", "cyan")
circ = circle(40, "solid", "cyan")

#rotate sheild
rotated = rotate(45, base_sheild)
sheild1 = overlay-align("center", "middle", squ, rotated)
sheild2 = overlay-align("center", "middle", circ, sheild1)
#display sheild
sheild2
