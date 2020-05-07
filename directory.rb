# STUDENTS DIRECTORY REFACTORING
# 1) we created an instance variable for the universe class
# in this way all the methods will be able to access it
# even without giving it as an argument.
# 2) interactive menu method is too long, we need to divide it 
# into multiple, shorter methods
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
    when "9"
      exit 
    else
      puts "I don't know what you meant, try again"
  end 
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp) # nice, I didn't know this!
  end
end

interactive_menu