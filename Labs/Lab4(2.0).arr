use context dcic2024
include gdrive-sheets

sheetID = "11C-dNV_EUUE3GeqLscr2ijEkEYZtUUP_4OHGSzyvDTE/edit?gid=680420778#gid=680420778"
flight = load-spreadsheet(sheetID)

flights = load-table: row-names, dep-time, sched-dep-time, dep-delay, arr-time, sched-arr-time, arr-delay, carrier, flight, tailnum, origin, dest, air-time, distance, hour, minute, time-hour
    source: flight.sheet-by-name("flights", true)
end