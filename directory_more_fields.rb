# print header inc. name of Academy
def print_header
    puts "The students of Villains Academy".center(50)
    puts "-------------".center(50)
end

#print list of students
def print(students)
  if students.length > 0
    cohorts = []
    students.each do |student_info|
      if (cohorts.include? (student_info[:cohort])) == false
        cohorts << student_info[:cohort]
      end
    end

    cohorts.each do |cohort|
      puts "Students in the #{cohort} cohort".center(50)
      puts "-------------".center(50)
      students.each_with_index do |student_info, index|
        if cohort == student_info[:cohort]
          puts "#{index+1}. #{student_info[:name]} (#{student_info[:cohort]} cohort).".center(50)
          if student_info[:pronoun] == "they"
            puts "#{student_info[:name]} is #{student_info[:height]} tall, was born in #{student_info[:country]} and #{student_info[:pronoun]} like #{student_info[:hobbies]}.".center(50)
          else
            puts "#{student_info[:name]} is #{student_info[:height]} tall, was born in #{student_info[:country]} and #{student_info[:pronoun]} likes #{student_info[:hobbies]}.".center(50)
          end
        end
      end
    end
  else puts "No students in database"
  end
end
# print number of students
def print_footer(student_info)
  if student_info.length == 1
    puts "Overall, we have #{student_info.length} great student.".center(50)
  elsif student_info.length > 1
    puts "Overall, we have #{student_info.length} great students.".center(50)
  end
end

# method to obtain cohort list from user

def get_students
  months = [
    "january",
    "february",
    "march",
    "april",
    "may",
    "june",
    "july",
    "august",
    "september",
    "october",
    "november",
    "december"
  ]
  students = Array.new
  puts "What is the name of the student?".center(50)
    while true
    inputname = gets.chomp
    break if inputname == ""
    puts "What is #{inputname}'s cohort?".center(50)
    inputcohort = gets.chomp.downcase
    while true
        break if months.include? (inputcohort)
        puts "Check your spelling. What is #{inputname}'s cohort?".center(50)
        inputcohort = gets.chomp.downcase
    end
    puts "What is #{inputname}'s country of birth?".center(50)
    inputcountry = gets.chomp
    puts "What pronoun do they prefer?".center(50)
    inputpronoun = gets.chomp
    puts "What is #{inputname}'s height?".center(50)
    inputheight = gets.chomp
    puts "What are #{inputname}'s hobbies?".center(50)
    inputhobbies = gets.chomp

    students << student_in_hash(inputname, inputpronoun, inputcohort, inputcountry, inputheight, inputhobbies)

    if students.length == 1
      puts "Now, we have #{students.length} student. To add more, type another name.".center(50)
    else
      puts "Now, we have #{students.length} students. To add more, type another name.".center(50)
    end

    puts "Otherwise, press enter.".center(50)
  end
  return students
end

# add student to a hash with default arguments
def student_in_hash(inputname, inputpronoun, inputcohort, inputcountry, inputheight, inputhobbies)
  inputpronoun = "they" if inputpronoun == ""
  inputcohort = "november" if inputcohort == ""
  student = {
    name: inputname,
    pronoun: inputpronoun,
    cohort: inputcohort.to_sym,
    country: inputcountry,
    height: inputheight,
    hobbies: inputhobbies
  }
  return student
end

def interactive_menu
  students = []
  loop do
    puts "What would you like to do? Please enter a number.".center(50)
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = get_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else puts "I don't know what you mean. Please try again."
    end
  end
end

interactive_menu
