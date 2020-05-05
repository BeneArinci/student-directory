# let's crate an array and put all our sutents inside it
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"]
# let's create a few methods we will use for printing what we need
# first one is going to be used to print the header
def print_header
  puts "The students of Villains Academy"
  puts "------------"
end
# second method is to print the names in the array
def print_names(names)
  names.each do |name|
    puts name
  end 
end
# third method is used to print the footer
def print_footer(names)
puts "Overall, we have #{names.count} great students "
end
# nothing will happen till we call our methods with the correct parameters
print_header
print_names(students)
print_footer(students)