# print header inc. name of Academy
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#print list of students
def print(students)
  students.each_with_index do |student_info, index|
    puts "#{index+1}. #{student_info[:name]} (#{student_info[:cohort]} cohort)."
    puts "#{student_info[:name]} is #{student_info[:height]} tall, was born in #{student_info[:country]} and #{student_info[:pronoun]} likes #{student_info[:hobbies]}."
  end
end
# print number of students
def print_footer(student_info)
  puts "Overall, we have #{student_info.length} great students"
end

# method to obtain cohort list from user

def input_students
  students = Array.new
  puts "To finish, just hit return twice"
  while true
    puts "What is the name of the student?"
    inputname = gets.chomp
    break if inputname == ""
    puts "What is #{inputname}'s country of birth?"
    inputcountry = gets.chomp
    puts "What pronoun do they prefer?"
    inputpronoun = gets.chomp
    puts "What is #{inputname}'s height?"
    inputheight = gets.chomp
    puts "What are #{inputname}'s hobbies?"
    inputhobbies = gets.chomp

    students << {
      name: inputname,
      pronoun: inputpronoun,
      cohort: :november,
      country: inputcountry,
      height: inputheight,
      hobbies: inputhobbies
    }
    puts "Now, we have #{students.length} students"
  end
  return students
end

students = input_students
print_header
print(students)
print_footer(students)
