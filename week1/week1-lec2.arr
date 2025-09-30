use context starter2024

#WEEK 1, CLASS 2

6 - 2

"hello world"

#multi line print
```
Hello 
World

```

"josh" + " eats apples"
'hello'

#name and printing them and other stuff
s = "barry "
n = 7
print(s)
string-length(s)
string-repeat(s, n)

#circles 
i1 = circle(30, "solid", "blue")
i2 = rectangle(40, 20, "solid", "green")
i3 = triangle(50, "outline", "red")
overlay(i1,i2)
above(i1,i2)
below(i1,i2)



"this begins class exercise"
""
#exercise 1
String_ex = "hello cs2000!"
string-to-upper(String_ex)

#variation of upper case 
string-to-upper("hello from cs2000!")


#exercise 2
#Create a blue circle and a yellow rectangle, then overlay them so the circle appears on top. Stack a green rectangle above a purple rectangle using above.
a1 = circle(30, "solid", "blue")
a2 = rectangle(90, 20, "solid", "yellow")
a3 = rectangle(40, 20, "solid", "purple")
az = rectangle(40, 20, "solid", "green")
overlay(a1, a2)
above(az, a3)

#exercise 3: red rectangle that is 100 wide by 20 tall in two different ways
a4 = rectangle(100, 20, "solid", "red")
rotate(100, a4)
rotate(45, rectangle(100, 20, "solid", "red"))

#exercise 4: Create a Stop sign. text, regular-polygon, and other functions you've already seen may be helpful.
a5 = regular-polygon(115, 8, "solid", "red")
a6 = regular-polygon(120, 8, "solid", "white")
a7 = text("STOP", 100, "white")
over = overlay(a5, a6)
overlay-align("center", "middle", a7, over)

#exercise 5:
a9 = circle(100, "solid", "red")
a10 = circle(115, "solid", "orange")
a11 = circle(125, "solid", "yellow")
a12 = circle(135, "solid", "green")
a13 = circle(145, "solid", "cyan")
a14 = circle(155, "solid", "blue")

overlay1 = overlay(a9, a10)
overlay2 = overlay(overlay1, a11)
overlay3 = overlay(overlay2, a12)
overlay4 = overlay(overlay3, a13)
overlay5 = overlay(overlay4, a14)

overlay5

