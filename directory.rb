# let's crate an array and put all our sutents inside it
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
# let's create a few methods we will use for printing what we need
# first one is going to be used to print the header
def print_header
  puts "The students of Villains Academy"
  puts "------------"
end
# second method has now changed in order to interact with multipe info regarding the students
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
print_header
print(students)
print_footer(students)