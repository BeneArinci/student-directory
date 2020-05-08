@students = []
def input_students
  puts "Please, enter the name of the students"
  puts "To finish, just hit the return twice"
  name = gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
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
# let's add a method that allows us to save our students list on a csv file
def save_students
  # open the file for writing (it's going to be created in the same folder)
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line # if we call puts to a file, it's going to print in it instead of printing to screen
  end
  file.close
end
# we are giving our method a file name as an argument. 
# our file students.csv will be the default one and we don't even need to call it from the command line
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
file.close
end 
# in order to give the possibility to the user to load data from anoter file using the command line
# we now define this method
def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out from the method if the file name isn't given
  if File.exist?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def interactive_menu
  loop do
    
    print_menu
    process(gets.chomp) # nice, I didn't know this!
  end
end


try_load_students
interactive_menu