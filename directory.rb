require 'csv'
@students = []
@filename = ARGV.first

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # get the first name
    name = STDIN.gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
      # add the student hash to the array
      add_students(name, "november")
      puts "Now we have #{@students.count} students"
      # get another name from the user
      name = STDIN.gets.chomp
    end
  end
  
  def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end
  
  def print_student_list
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
  
  def print_footer
    puts "Overall, we have #{@students.count} great students"
  end
  
def print_menu
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list"
    puts "4. Load the list"
    puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      check_if_file_exists(enter_filename)
    when "9"
      exit
    else 
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  CSV.open(enter_filename, "wb") do |csv|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv << student_data
    end
  end
  puts "Sucessfully saved list"
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def load_students(filename)
  CSV.foreach (filename) do |row|
    name, cohort = row.join(",").chomp.split(",")
    add_students(name, cohort)
  end
  puts "Sucessfully loaded list"
end

def try_load_students
  @filename = "students.csv" if @filename.nil?
  check_if_file_exists(@filename)
end

def check_if_file_exists(filename)
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def enter_filename
  puts "Enter filename"
  input = gets.chomp
end

try_load_students
interactive_menu