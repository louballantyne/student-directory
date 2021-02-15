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
# print student list
puts "The students of Villains Academy"
puts "-------------"
puts students.each { |student| puts student }
# print number of students
puts "Overall, we have #{students.length} great students"
