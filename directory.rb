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

# now, instead of having a precompiled array of students, we'll use our methods
# with a new students variable that is given by our new method input_students
students = input_students
print_header
print(students)
print_footer(students)