class Student

  def get_name
    @name = gets.chomp
  end

  def get_country
    @country = gets.chomp
  end

  def get_cohort
    cohorts = ["september", "october", "november", "december"]
    while true do
      @cohort = gets.chomp
      if cohorts.include?(@cohort)
        break
      end
    end
  end

  def name
    @name
  end

  def country
    @country
  end

  def cohort
    @cohort
  end

end

def input_students

  students = []

  while true do

    puts "Enter the name of a student to add them to the system".center(100)
    puts "To finish, just hit return without writing anything".center(100)
    student = Student.new
    student.get_name
      if student.name.empty?
        break
      else
      puts "Please enter the student's country of origin".center(100)
      student.get_country
      puts "Please enter the student's cohort".center(100)
      student.get_cohort

      students << {name: student.name, country: student.country, cohort: student.cohort.downcase.to_sym}

      if students.length == 1
        puts "Now we have #{students.count} student".center(100)
      else
      puts "Now we have #{students.count} students".center(100)
      end
    end
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end
def sort_students(students)
  if !0
    students.sort_by { |student| student[:cohort] }
  end
end
def print(students)
  counter = 0
  until counter == students.length
    puts "#{counter+1}. #{students[counter][:name]}, Country of origin: #{students[counter][:country]} (#{students[counter][:cohort]} cohort)".center(100)
    counter += 1
  end
end

def print_footer(students)
  if students.length == 1
    puts "Overall, we have #{students.count} great student".center(100)
  else
    puts "Overall, we have #{students.count} great students".center(100)
  end
end

#students = sort_students(input_students)
#if students.length < 1
  #puts "Sorry, we don't have any students right now.".center(100)
#else
  students = input_students
  print_header
  print(students)
  print_footer(students)
