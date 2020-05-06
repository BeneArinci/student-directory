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
  puts "The students of Villains Academy (names shorter than 12 characters)"
  puts "------------"
end
# Rewrite the each() method that prints all students using while or until control flow methods (Loops).
def print(students)
  index = 0
  while index < students.length do
    puts "#{students[index][:name].capitalize} (#{students[index][:cohort]} cohort)"
    index +=1
  end
    
  
end

def print_footer(students)
puts "Overall, we have #{students.count} great students "
end

students = input_students
print_header
print(students)
#print_footer(students)