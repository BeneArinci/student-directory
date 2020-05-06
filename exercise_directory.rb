# This rb file will contain all the exercises (step8 - week 4)
# In the input_students method the cohort value is hard-coded. 
# How can you ask for both the name and the cohort? 
# What if one of the values is empty? Can you supply a default value? 
# The input will be given to you as a string? How will you convert it to a symbol? 
# What if the user makes a typo?

def input_students
  students = []
  # creating the list of possible cohort start months
  cohorts = ["january", "february", "march", "april", "may", "june", "july",
  "august", "september", "october", "november", "december"]
  # set up the current month to insert as a default value when the student's cohort is not indicated
  current_month = "may"
  puts "Please, enter the name of the students"
  puts "To finish, just hit the return twice"
  # just to make it easier I got rid of the other info and I am working only on 'name' and 'cohort'
  while true do
    puts "Who is the next student?"
    name = gets.chomp
      # my main loop is breaking only when the user leave empty the field 'name'
      if name.empty?
        puts "Now we have #{students.count} students"
        break
      end
    puts "What is the student's cohort starting month"
    cohort = gets.chomp
        # I am creating another loop to keep on asking for the cohort until it's left empty or it is an expected one
        until cohorts.include?(cohort.downcase) || cohort.empty?
          puts "Inexistent cohort, please enter again"
          cohort = gets.chomp
        end
      # if left empty, I am assigning a default value (current_month)
      # I am also transforming the cohort value in a symbol (like it was when hardcoded)
      if cohort.empty?
        students << {name: name.capitalize, cohort: current_month.capitalize.to_sym}
      else
        students << {name: name.capitalize, cohort: cohort.capitalize.to_sym}
      end
    puts "Now we have #{students.count} students"
  end 
 students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~".center(100)
end

def print(students)
  index = 0
  while index < students.length do
    puts "#{students[index][:name]} (#{students[index][:cohort]} cohort)".center(100)
    puts "--------------------------------".center(100)
    index +=1
  end
end

def print_footer(students)
puts "Overall, we have #{students.count} great students ".center(100)
end

students = input_students
print_header
print(students)
print_footer(students)

