def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"

    # create empty array
    students = []
    # get first name
    name = gets.chomp
    # create while loop to add name 
    while !name.empty? do
        # adds student hash to array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name
        name = gets.chomp
    end
    # return array
    return students
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_names(names)
    names.each { |student| puts "#{student[:name]} #{student[:cohort]} cohort" }
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print_names(students)
print_footer(students)