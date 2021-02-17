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

# print details about each student
def print_info_each_student
  list_cohorts
  @cohorts.each do |cohort|
    puts "\nStudents in the #{cohort.capitalize} Cohort:\n".center(50)
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
    name = STDIN.gets.chomp
    break if name == ""
    puts "What is #{name}'s cohort?".center(50)
    cohort = STDIN.gets.chomp.downcase
    while true
        break if months.include? (cohort)
        puts "Check your spelling. What is #{name}'s cohort?".center(50)
        cohort = STDIN.gets.chomp.downcase
    end
    puts "What is #{name}'s country of birth?".center(50)
    country = STDIN.gets.chomp
    puts "What pronoun do they prefer?".center(50)
    pronoun = STDIN.gets.chomp
    puts "What is #{name}'s height?".center(50)
    height = STDIN.gets.chomp
    puts "What are #{name}'s hobbies?".center(50)
    hobbies = STDIN.gets.chomp

    @students << student_in_hash(name, pronoun, cohort, country, height, hobbies)

    plural = "s" if @students.length > 1

    puts "\nNow, we have #{@students.length} student#{plural}. To add more, type another name.".center(50)
    puts "Otherwise, press enter.".center(50)
  end
end

# print user options to screen
def print_menu
  puts "\nWhat would you like to do? Please enter a number.".center(50)
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students to students.csv"
  puts "4. Load the students from students.csv"
  puts "9. Exit"
end

# print the students to the screen
def show_students
  print_header
  print_students_list
  print_footer
  puts "#{@students.count} students shown."
end

# define what happens depending on selected option
def process(selection)
  case selection
  when "1"
    get_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    puts "Goodbye"
    exit
  else puts "I don't know what you mean. Please try again."
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end
# save student information to a file
def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student = [
      student[:name],
      student[:cohort],
      student[:pronoun],
      student[:height],
      student[:country],
      student[:hobbies]
    ]
    csv_line = student.join(",")
    file.puts csv_line
  end
  file.close
  puts "Saved #{@students.length} students to file."
end

# load students from File
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, pronoun, height, country, hobbies = line.chomp.split(",")
    @students << student_in_hash(name, pronoun, cohort, country, height, hobbies)
  end
  file.close
  puts "Loaded #{@students.count} students.\n"
end

# add student to a hash with default arguments
def student_in_hash(name, pronoun, cohort, country, height, hobbies)
  pronoun = "they" if pronoun == ""
  cohort = "november" if cohort == ""
  student = {
    name: name,
    pronoun: pronoun,
    cohort: cohort.to_sym,
    country: country,
    height: height,
    hobbies: hobbies
  }
  return student
end

def try_load_students
  filename = ARGV.first
  filename = "students.csv" if filename.nil?
  if File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
