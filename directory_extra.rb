def input_students

  cohorts = ["september", "october", "november", "december"]

  puts "Enter the name of a student to add them to the system"
  puts "To finish, just hit return three times"
  name = gets.chomp
  puts "Please enter the student's country of origin"
  country = gets.chomp
  while true
    puts "Please enter the student's cohort"
    cohort = gets.chomp
      if cohorts.include?(cohort)
        break
      elsif cohort.empty?
        break
      end
  end


  students = []

  while !name.empty? do

    students << {name: name, country: country, cohort: cohort.downcase.to_sym}
    if students.length == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end

    puts "Please enter the name of a student"
    puts "To finish, just hit return without typing anything"
    name = gets.chomp

    if !name.empty?
      puts "Please enter the student's country of origin"
      country = gets.chomp
      if !country.empty?
          puts "Please enter the student's cohort"
          while true
          cohort = gets.chomp
            if cohorts.include?(cohort)
              break
            end
          end
      end


    end
  end
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def sort_students(students)
  students.sort_by { |student| student[:cohort] }
end
def print(students)
  counter = 0
  until counter == students.length
    puts "#{counter+1}. #{students[counter][:name]}, Country of origin: #{students[counter][:country]} (#{students[counter][:cohort]} cohort)"
    counter += 1
  end
end
def print_footer(students)
  if students.length == 1
    puts "Overall, we have #{students.count} great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

students = sort_students(input_students)
print_header
print(students)
print_footer(students)
