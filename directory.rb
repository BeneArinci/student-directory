# Instead of manually feeding our array of students we are now going to ask the user to do that
# First thing to do is to create a method
def input_students
  puts "Please, enter the name of the students"
  puts "To finish, just hit the return twice"
  # we create an empty array that will contain all the input names
  students = []
  # we get the first name
  name = gets.chomp
  # let's create a loop that, while the name is not an empty string, will execute an action
  while !name.empty? do
    # the first action is to add the students to our students array
    students << {name: name, cohort: :november}
    # the second one is to update the user with the current number of students
    puts "Now we have #{students.count} students"
    # now we ask for the next name
    name = gets.chomp
  end 
  # after the loop break, our program's last action is to return the the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end
# second method has now changed in order to interact with multipe info regarding the 
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end 
end
# third method is used to print the footer
def print_footer(students)
puts "Overall, we have #{students.count} great students "
end
# nothing will happen till we call our methods with the correct parameters

# instead of manually calling our methods, let's add an interactive menu
# the user will decide themself what method to call

def interactive_menu
  students = []
  loop do
  # 1. print the menu and ask the user what they want to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we are going to add more values
  # 2. read the input and save it into a variable
  selection = gets.chomp
  # 3. do what the user have asked 
  case selection
    when "1"
      # input the students
      students = input_students
    when "2"
      # show the students
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end 
  # 4. send back to step 1
  # when the entire loop has been read and all the actions taken, we end it and 
  # we send the user back to the first line of it
  end
end

interactive_menu
