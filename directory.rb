# declare variables
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# print header inc. name of Academy
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#print list of students
def print(names)
  names.each { |student| puts student }
end
# print number of students
def print_footer(names)
  puts "Overall, we have #{names.length} great students"
end

print_header
print(students)
print_footer(students)
