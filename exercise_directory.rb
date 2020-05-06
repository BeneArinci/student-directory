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
  puts "The students of Villains Academy (letters B and G)"
  puts "------------"
end
# Modify your program to only print the students whose name begins with a specific letter.
# I chose the letter B and G
def print(students)
  students.each do |student|
    if student[:name].capitalize.start_with?("B") || 
    student[:name].capitalize.start_with?("G")
      puts "#{student[:name].capitalize}"
    end
  end 
end

def print_footer(students)
puts "Overall, we have #{students.count} great students "
end

students = input_students
print_header
print(students)
#print_footer(students)