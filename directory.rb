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
# now let's print all the students iterating over the array elements
puts "The students of Villains Academy"
puts "------------"
students.each do |name|
  puts name
end 
# we print the total using a count method (it returns the number of elements of an array)
puts "Overall, we have #{students.count} great students "

