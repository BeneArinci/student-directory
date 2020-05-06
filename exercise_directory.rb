# This rb file will contain all the exercises (step8 - week 4)
# every commitment will contain an exercise completed
# Our code only works with the student name and cohort. 
# Add more information: hobbies, country of birth, height, etc.
def input_students
  students = []
  puts "Please, enter the name of the students"
  puts "To finish, just hit the return twice"
  name = gets.chomp
  puts "How old is the student?"
  age = gets.chomp
  puts "What's their nationality?"
  nationality = gets.chomp
  while true do
    students << {name: name, age: age, nationality: nationality, cohort: :november}
    puts "Now we have #{students.count} students"
    puts "Who is the next student?"
    name = gets.chomp
    if name.empty?
      break
    else
      puts "How old is the student?"
      age = gets.chomp
      puts "What's their nationality?"
      nationality = gets.chomp
    end
  end 
students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~".center(100)
end
# Research how the method center() of the String class works. 
# Use it in your code to make the output beautifully aligned.
def print(students)
  index = 0
  while index < students.length do
    puts "#{students[index][:name].capitalize} (#{students[index][:cohort]} cohort) is #{students[index][:age]} years old and #{students[index][:nationality]}.".center(100)
    puts "--------------------------------".center(100)
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