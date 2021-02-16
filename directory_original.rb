# print header inc. name of Academy
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#print list of students
def print(students)
  students.each_with_index { |student_info, index| puts "#{index+1}. #{student_info[:name]}, (#{student_info[:cohort]} cohort)" }
end
# print number of students
def print_footer(student_info)
  puts "Overall, we have #{student_info.length} great students"
end

# method to obtain cohort list from user

def input_students
  students = Array.new
  puts "What is the name of the student?"
  puts "To finish, just hit return twice"
  while true
    input = gets.chomp
    break if input == ""
    students << {name: input, cohort: :november}
    puts "Now, we have #{students.length} students"
  end
  return students
end

students = input_students
print_header
print(students)
print_footer(students)
