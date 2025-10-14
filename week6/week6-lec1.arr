use context dcic2024

#STRUCTURED DATA
data BookRecord: 
    book(title :: String, author :: String, pages :: Number)
end 

book1 = book("The Disposed", "Anna Stillmoor", 500)



data MobileRecord:
    phone(tite :: String, model :: String, color :: String, storage:: Number)
end

phone1 = phone('iphone', '13 Pro', 'Blue', 64)
phone2 = phone('iphone', '17 Pro', 'Orange', 512)

#display phone2 color
phone2.color
#phone1 storage
phone1.storage

fun compare-storage(a :: MobileRecord, b:: MobileRecord):
  doc: "compares phone storage"
  if a.storage > b.storage: a
  else if a.storage < b.storage: b
  else: "both have same amount of storage"
  end
end
compare-storage(phone1, phone2)

fun compute-cost(p :: MobileRecord) -> Number:
  doc: "Computers phone cost based on storage"
  base-price = 500
  price-per-gb = 2
  base-price + (p.storage * price-per-gb)
where: 
  compute-cost(phone1) is 628
end



fun compute-cost-condition(p :: MobileRecord) -> Number:
  doc: "Compute phone cost based on storage, model, and color"

  #base price depends on model 
  base-price = 
    if p.model == "13 Pro": 799
    else if p.model == "14 Pro": 999
    else if p.model == "17 Pro": 1399
    else: 699
    end 
  
  #storage
  storage-cost =
    if p.storage <= 64: 0
    else if p.storage <= 128: 100
    else if p.storage <= 256: 200
    else if p.storage <= 512: 400
    else: 600
    end 
 
  #color
  color-cost = 
    if (p.color == "Orange") or (p.color == "Purple"): 150
    else: 0
    end
  
  base-price + storage-cost + color-cost
  
where: 
  compute-cost-condition(phone1) is 799 + 0 + 0
  compute-cost-condition(phone2) is 1399 + 400 + 150
end 


#-----------------------------------------
#CONDITIONAL DATA
data Priority:
  | low
  | medium
  | high
end

task1-prio = low
task2-prio = high
task3-prio = medium