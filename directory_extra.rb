# First we put the list of students into an array
def input_students

  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  puts "Please enter the student's country of origin"
  country = gets.chomp

  students = []

  while !name.empty? do

    students << {name: name, country: country, cohort: :november}
    puts "Now we have #{students.count} students"

    puts "Please enter the name of a student"
    puts "To finish, just hit return twice"
    name = gets.chomp

    if !name.empty?
      puts "Please enter the student's country of origin"
      country = gets.chomp
    end
  end
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  counter = 0
  until counter == students.length
    puts "#{counter+1}. #{students[counter][:name]}, Country of origin: #{students[counter][:country]} (#{students[counter][:cohort]} cohort)"
    counter += 1
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
