@students = []
@cohorts = ["september", "october", "november", "december"]

def input_students
  puts "Please enter the name of a student"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp

  while !name.empty? do
    while true
      puts "Please enter the student's cohort"
      cohort = STDIN.gets.chomp
      if @cohorts.include?(cohort.downcase)
        break
      end
    end
    add_students(name, cohort)
    puts "Now we have #{@students.count} students"
    puts "Please enter the name of a student"
    puts "To finish, just hit return twice"
    name = gets.chomp
  end
  @students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list of students from a file"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
    puts "Press enter to return to menu"
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    puts "Please type the name of the file you want to load"
    load_students(STDIN.gets.chomp)
  when "9"
    exit
  else
    puts "I don't know what you mean. Please, try again."
  end
end

def save_students
  puts "Please enter a filename"
  filename = STDIN.gets.chomp
  if filename.nil?
    filename = "student.csv"
  elsif !File.exists?(filename)
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
  file = File.open(filename, "w")
  counter = 0
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
    counter += 1
    end
  file.close
  puts "Saved #{counter} students to 'students.csv'"
end

def load_students(filename = "students.csv")
  if filename.empty?
    puts "Sorry, you didn't type anything"
    exit
  elsif !File.exist?(filename)
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
  file = File.open(filename, "r")
  counter = 0
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  add_students(name, cohort)
  counter += 1
  end
  file.close
  puts "Loaded #{counter} students from #{filename}"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
  elsif File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
