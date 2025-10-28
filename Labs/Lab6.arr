use context dcic2024
include lists
include data-source
include csv

student-score = load-table: 
  Name :: String,
  Surname :: String,
  Email :: String, 
  Score :: Number
  source: csv-table-file("students_gate_exam_score.csv", default-options)
end

#print student-score table 
student-score


######################################################################
#1.1 
top = order-by(student-score, "Score", false)
#print top table 
top

#extracts the top 3 students based on score 
top-1 = top.row-n(0)
top-2 = top.row-n(1)
top-3 = top.row-n(2)

#print top 3 students to check everything is in order
#top-1
#top-2
#top-3


######################################################################
#1.2
data Student: single-student(name :: String, surname :: String, score :: Number ) end
    
  