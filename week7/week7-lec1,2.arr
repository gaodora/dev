use context starter2024

data TaxonomyTree:
  node(rank :: String, name :: String, children :: List<TaxonomyTree>)
end

# Example: Part of the cat family
lion = node("Species", "Panthera leo", [list: ])
tiger = node("Species", "Panthera tigris", [list: ])
leopard = node("Species", "Panthera pardus", [list: ])
panthera = node("Genus", "Panthera", [list: lion, tiger, leopard])

house-cat = node("Species", "Felis catus", [list: ])
wildcat = node("Species", "Felis silvestris", [list: ])
felis = node("Genus", "Felis", [list: house-cat, wildcat])

felidae = node("Family", "Felidae", [list: panthera, felis])
#############################################

#a node with no children is a leaf node
#lion tiger leopard house-cat and wildcat are leaves bc they have no children

#fun checks if a node is a leaf
fun is-leaf(t :: TaxonomyTree) -> Boolean:
  is-empty(t.children)
where:
  is-leaf(house-cat) is true
  is-leaf(felis) is false
end
#############################################

#count number of nodes in a generic tree 
#one fun process a single node, other process a list of trees (the children)
fun count-nodes(t :: TaxonomyTree) -> Number:
   1 + count-nodes-children(t.children)
where:
  count-nodes(lion) is 1
  count-nodes(panthera) is 4
  count-nodes(felis) is 3
  count-nodes(felidae) is 8
end

fun count-nodes-children(c :: List<TaxonomyTree>) -> Number:
  cases (List) c:
    | empty => 0
    | link(first, rest) =>
      count-nodes(first) + count-nodes-children(rest)
  end
end


  









#WEEK 7 CLASS @
data River: 
  | merge(width :: Number, left :: River, right :: River)
  | stream(flow-rate :: Number)
end 

#ex
stream-a = stream(5)
stream-b = stream(3)
stream-c = stream(8)

stream-a

#merger points (nodes with two children)
merge-1 = merge(12, stream-a, stream-b)
main-river = merge(15, merge-1, stream-c)

merge-1
main-river

fun total-flow(r :: River) -> Number:
  cases (River) r: 
    | merge(width, left, right) => total-flow(left) + total-flow(right)
    | stream(flow) => flow
  end 
  
where: 
  total-flow(stream-a) is 5
  total-flow(main-river) is 16
end 
#end of total-flow


fun count-merges(r :: River) -> Number: 
  cases (River) r: 
    | merge(width, left, right) => 1 + count-merges(left) + count-merges(right)
    |stream(flow) => 0
  end
where: 
  count-merges(stream-a) is 0
  count-merges(main-river) is 2
end
#end of count-merges 


fun count-streams(r :: River) -> Number:
  doc: 'count the number of individual streams'
  cases (River) r: 
    | merge(width, left, right) => count-streams(left) + count-streams(right)
    | stream(flow) => 1
  end
where: 
  count-streams(stream-a) is 1
  count-streams(merge-1) is 2
  count-streams(main-river) is 3
end
#end of count-strings


fun max-width(r :: River) -> Number: 
  doc: 'max width of river'
  cases (River) r:  
    | stream(flow-rate) => 0
    | merge(width, left, right) => 
      num-max(width, num-max(max-width(left), max-width(right)))
  end
where:
  max-width(stream-a) is 0
  max-width(merge-1) is 12
  max-width(main-river) is 15
end
#end of max-width


fun widen-river(r :: River, amount :: Number) -> River: 
  doc: 'makes a new river where merge point is wider by amount'
  cases (River) r: 
    | stream(f) => stream(f)
    | merge(width, left, right) => 
      merge(width + amount, widen-river(left, amount), widen-river(right, amount))
  end
where: 
  widen-river(main-river, 10).width is 25
  widen-river(main-river, 10).left.width is 22
end 
#end of widen-river


fun cap-flow(r :: River, cap :: Number) -> River: 
  doc: 'make new river where stream-flow is capped'
  cases (River) r: 
    | stream(f) => 
      if f <= cap : stream(f) 
      else : stream(cap)
      end
    | merge(width, left, right) => 
      merge(width, cap-flow(left, max-flow), cap-flow(right, max-flow))
end 
#end of cap-flow