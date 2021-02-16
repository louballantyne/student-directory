@students = []
@cohorts = []
# print header inc. name of Academy
def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

# compile a list of cohorts
def list_cohorts
  @students.each do |student_info|
    if (@cohorts.include? (student_info[:cohort])) == false
      @cohorts << student_info[:cohort]
    end
  end
end

#print details about each student
def print_info_each_student
  list_cohorts
  @cohorts.each do |cohort|
    puts "\nStudents in the #{cohort} cohort\n".center(50)
    @students.each_with_index do |student_info, index|
      if cohort == student_info[:cohort]
        puts "#{index+1}. #{student_info[:name]}".center(50)
        plural = "s" if student_info[:pronoun] != "they"
        puts "#{student_info[:name]} is #{student_info[:height]} tall, was born in #{student_info[:country]} and #{student_info[:pronoun]} like#{plural} #{student_info[:hobbies]}."
      end
    end
  end
end
# print list of students
def print_students_list
  if @students.length > 0
    print_info_each_student
  else puts "No students in database"
  end
end

# print number of students
def print_footer
  if @students.length == 1
    puts "\nOverall, we have #{@students.length} great student.".center(50)
  elsif @students.length > 1
    puts "\nOverall, we have #{@students.length} great students.".center(50)
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

    @students << student_in_hash(inputname, inputpronoun, inputcohort, inputcountry, inputheight, inputhobbies)

    plural = "s" if @students.length > 1

    puts "\nNow, we have #{@students.length} student#{plural}. To add more, type another name.".center(50)
    puts "Otherwise, press enter.".center(50)
  end
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

def print_menu
  puts "\nWhat would you like to do? Please enter a number.".center(50)
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    get_students
  when "2"
    show_students
  when "9"
    exit
  else puts "I don't know what you mean. Please try again."
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
