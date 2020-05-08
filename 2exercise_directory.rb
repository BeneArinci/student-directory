# In this file I'll be working on the step14 exercises
# Continue refactoring the code. Which method is a bit too long? What method names 
# are not clear enough? Anything else you'd change to make your code look more elegant? 
# Why?
@students = []
# I am changing the name of this method to adding_students so it's more clear
def adding_students(name)
  @students << {name: name, cohort: :november}
end

def input_students
  puts "Please, enter the name of the students"
  puts "To finish, just hit the return twice"
  name = gets.chomp
  while !name.empty? do
    adding_students(name)
    puts "Now we have #{@students.count} students"
      name = gets.chomp
  end 
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end 
end

def print_footer
puts "Overall, we have #{@students.count} great students "
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" 
end

def show_students
  print_header
  print_student_list
  print_footer 
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit 
    else
      puts "I don't know what you meant, try again"
  end 
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line 
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    adding_students(name)
  end
file.close
end 
# I am changing this name too because "try load students" is not clear enough
def initial_students_loading
  filename = ARGV.first
  if filename.nil?
    load_students
    puts "Loaded #{@students.count} from students.cvs"
  elsif File.exist?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end
# I am looking at the code but I don't see what changes I could make maintaining 
# the same functionality. For now I've just changed the methods names to make them
# more readable and understandable

initial_students_loading
interactive_menu