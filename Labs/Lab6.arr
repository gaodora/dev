use context dcic2024
include lists
include data-source
include csv

student-score = load-table: 
  Name :: String,
  Surname :: String,
  Email :: String, 
  Score :: Number
  source: csv-table-file('students_gate_exam_score.csv', default-options)
end

#print student-score table 
student-score

#TASK 1
######################################################################
#1.1 
top = order-by(student-score, 'Score', false)
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
#1.2 AND 1.3
data Student: student(name :: String, surname :: String, score :: Number ) end
  
#3 Student values representing the top 3 students
s1 = student('Ethan', 'Gray', 97)
s2 = student('Oscar', 'Young', 92)
s3 = student('Adrian', 'Bennett', 80)


######################################################################
#1.4
scores :: List<Number> =  
  link(s1.score, link(s2.score, link(s3.score, empty)))

#print scores of the top 3 scores 
scores

#recursive fun to count >90 
fun counter(l :: List<Number>) -> Number: 
  doc: 'count the number of scores in the list greater than 90'
  cases (List) l: 
    | empty => 0 
    | link(f, r) =>
      if f > 90:
        1 + counter(r)
      else:
        counter(r)
      end
  end # end of cases
end #end of fun counter 

counter(scores)


#Task 2
######################################################################
#2.1
#uses get-column to extract all emails and put them in list all-emails
all-emails = student-score.get-column('Email')
#print all-emails
all-emails

######################################################################
#2.2
#create list of domain names from emails 
fun get-domain(r :: Row) 