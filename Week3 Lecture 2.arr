use context starter2024
include csv
include data-source

workouts = table: date :: String, activity :: String, duration :: Number
  row: "2025-04-01", "Running", 30
  row: "2025-04-02", "Yoga", 45
  row: "2025-04-03", "Cycling", 60
end

check:
  table: date :: String, activity :: String, duration :: Number
    row: "2025-04-01", "Running", 30
    row: "2025-04-02", "Yoga", 45
    row: "2025-04-03", "Cycling", 60
  end
  is-not
  table: date :: String, activity :: String, duration :: Number
    row: "2025-04-03", "Cycling", 60
    row: "2025-04-01", "Running", 30
    row: "2025-04-02", "Yoga", 45
  end
end

second-workout = workouts.row-n(1)
# -> Row: date = "2025-04-02", activity = "Yoga", duration = 45

second-workout["activity"]  # -> "Yoga"
# or all at once:
workouts.row-n(1)["duration"]  # -> 45



#experimenting with table, getting used to making a table, this table is about pets
experi_table1 = table: Owner_Name :: String, Pet_Type :: String, Pet_Name :: String, Pet_Age :: Number
  row: "John", "dog", "Sparky", 5
  row: "Alice", "cat", "Bond", 1
  row: "Mabel", "pig", "Waddles", 7
  row: "Samuel", "pigeon", "Dishwasher", 2
end

third-row = experi_table1.row-n(2) #finds third row aka mabel
third-row["Pet_Name"] #finds row 3 pet name -> waddles
experi_table1.row-n(0)["Pet_Type"]

#csv
recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/recipes.csv", default-options)
end




world-bank = load-table:
  country :: String,
  life-exp :: Number,
  gdp :: Number
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/life_exp_gdp.csv", default-options)
  sanitize life-exp using num-sanitizer
  sanitize gdp using num-sanitizer
end
lr-plot(world-bank, "gdp", "life-exp")