# This rb file will contain all the exercises (step8 - week 4)
# We've been using the chomp() method to get rid of the last return character. Find another method


def input_students
  students = []
  # creating the list of possible corhort start months
  cohorts = ["january", "february", "march", "april", "may", "june", "july",
  "august", "september", "october", "november", "december"]
  # set up the current month to insert as a default value when the student's cohort is not indicated
  current_month = "may"
  puts "Please, enter the name of the students"
  puts "To finish, just hit the return twice"
  # just to make it easier I got rid of the other info and I am working only on 'name' and 'cohort'
  while true do
    puts "Who is the next student?"
    # --> using g.sub method to get rid of the last return character <--
    name = gets.gsub!("\n","")
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
    # while our user is giving info about the students, I am making a difference
    # between the first name and the next ones
    if students.count == 1
      puts "Now we have a student"
    else
      puts "Now we have #{students.count} students"
    end 
  end
  students 
end 

def print_header
  puts "The students of Villains Academy".center(100)
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~".center(100)
end
# I am grouping by cohort key
# then I am iterating over the hashes that came out from the group by
# I am iterating again over the hashes' values (arrays of hashes)
# after that I am iterating again on the single hashes (single student) in order to change the value and to make it be just the name
def print(students)
  puts students.group_by {|student| student[:cohort]}
  .each {|cohort, students| students.map!{|single_student| single_student = (single_student[:name])}}
  .flatten
end

def print_footer(students)
  # using if statement to generate a difference between having a single or multiple students
  if students.count == 1
    puts "Overall, we have a great student".center(100)
  else
    puts "Overall, we have #{students.count} great students ".center(100)
  end
end

students = input_students
print_header
print(students)
print_footer(students)

