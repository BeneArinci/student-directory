
def hello
  puts "hello"
end
File.open(__FILE__, "r") do |f|
  f.each_line do |line|
    puts line
  end
end
