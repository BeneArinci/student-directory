# This rb file will contain all the exercises (step8 - week 4)
# every commitment will contain an exercise completed
def input_students
  puts "Please, enter the name of the students"
  puts "To finish, just hit the return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end 
students
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end
# We're using the each() method to iterate over an array of students. 
# How can you modify the program to print a number before the name of each student, 
# e.g. "1. Dr. Hannibal Lecter"? Hint: look into each_with_index()?
def print(students)
  students.each_with_index do |student, index|
    puts "#{(index + 1)}. #{student[:name]}"
  end 
end

def print_footer(students)
puts "Overall, we have #{students.count} great students "
end

students = input_students
print_header
print(students)
print_footer(students)