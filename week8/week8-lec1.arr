use context starter2024
#we're getting a lecture 2 of the same thing but a review is good
data TaxonomyTree: 
    node(rank :: String, name :: String, children :: List<TaxonomyTree>)
end

#ex
lion = node("Species", "Panthera leo", [list: ])
tiger = node("Species", "Panthera tigris", [list: ])
leopard = node("Species", "Panthera pardus", [list: ])
panthera = node("Genus", "Panthera", [list: lion, tiger, leopard])

house-cat = node("Species", "Felist catus", [list: ])
wildcat = node("Species", "Felis slivestris", [list: ])
felis = node("Genus", "Felis", [list: house-cat, wildcat])

felidae = node("Family", "Felidae", [list: panthera, felis])

fun count-nodes(t :: TaxonomyTree) -> Number: 
  doc: 'count this node and all children'
  1 + count-nodes-children(t.children)
end

fun count-nodes-children(c :: List<TaxonomyTree>) -> Number: 
  cases(List) c: 
    | empty => 0
    | link(first, rest) => 
      count-nodes(first) + count-nodes-children(rest)
  end
end

fun count-leaves(t :: TaxonomyTree) -> Number: 
  cases(List) t.children: 
    | empty => 1 #this node is a leaf
    | else => count-leaves-children(t.children)
  end
end

fun count-leaves-children(c :: List<TaxonomyTree>) -> Number:
  cases (List) c:
    | empty => 0
    | link(first, rest) =>
      count-leaves(first) + count-leaves-children(rest)
  end
end






#class ex 1
fun count-species(t :: TaxonomyTree) -> Number:
  doc: "Count the number of nodes with rank 'Species' in the taxonomy tree"
  cases (TaxonomyTree) t:
    | node(rank, name, children) =>
        if rank == "Species":
          1 + count-species-list(children)
        else:
          count-species-list(children)
        end
  end
where:
  count-species(felidae) is 5
  count-species(felis) is 2
  count-species(panthera) is 3
end

fun count-species-list(lst :: List<TaxonomyTree>) -> Number:
  doc: "Helper function to count species in a list of taxonomy trees"
  cases (List) lst:
    | empty => 0
    | link(first, rest) =>
        count-species(first) + count-species-list(rest)
  end
end


#class ex2

