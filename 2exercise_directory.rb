# In this file I'll be working on the step14 exercises
# The filename we use to save and load data (menu items 3 and 4) is hardcoded. 
# Make the script more flexible by asking for the filename if the user chooses these menu items.
@students = []
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
  puts "3. Save the list of students to external file"
  puts "4. Load the list from esternal file"
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
      puts "Which file would you like to upload students from?"
      filename = gets.chomp
      while !File.exist?(filename)
        puts "Sorry, the indicated file doesn't exist, try again"
        filename = gets.chomp
      end
        load_students(filename)
    when "9"
      puts "Goodbye"
      exit 
    else
      puts "I don't know what you meant, try again"
  end 
end

def save_students
  puts "Which file would you like to save the students in? "
  filename = gets.chomp
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line 
  end
  file.close
  puts "New info have been added to the file, now we have #{@students.count} students"
end

def load_students(filename)
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    adding_students(name)
  end
file.close
puts "New students have been loaded"
end 

def initial_students_loading
  filename = ARGV.first
  if filename.nil?
    load_students("students.csv")
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

initial_students_loading
interactive_menu