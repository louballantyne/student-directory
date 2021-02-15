# declare variables
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
# print header inc. name of Academy
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#print list of students
def print(students)
  students.each { |student_info| puts "#{student_info[:name]}, (#{student_info[:cohort]} cohort)" }
end
# print number of students
def print_footer(student_info)
  puts "Overall, we have #{student_info.length} great students"
end

print_header
print(students)
print_footer(students)
