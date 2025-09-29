use context starter2024

include csv
include data-source

world-bank = load-table:
  country :: String,
  life-exp :: Number,
  gdp :: Number
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/life_exp_gdp.csv", default-options)
  sanitize life-exp using num-sanitizer
  sanitize gdp using num-sanitizer
end

lr-plot(world-bank, "gdp", "life-exp")