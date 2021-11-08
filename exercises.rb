def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"

    # create empty array
    students = []
    # get first name
    name, cohort = gets.chomp, gets.chomp
    cohort = "N/A" if cohort.empty?
    # create while loop to add name 
    while !name.empty? do
        # adds student hash to array
        students << {name: name, cohort: cohort.to_sym}
        puts "Now we have #{students.count} students"
        # get another name
        name, cohort = gets.chomp, gets.chomp
        cohort = "N/A" if cohort.empty?
    end
    # return array
    return students
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_names(names)
    sorted_hash = {}

    names.each do |student|
        cohort = student[:cohort]
        if sorted_hash[cohort] == nil
            sorted_hash[cohort] = []
        end    
        sorted_hash[cohort].push(student[:name]) 
    end

    sorted_hash.each { |key, value| puts "#{key}:\n#{value.join("\n")}".center(4) }   

end

def print_footer(names)
    if names.count == 1
        puts "Overall, we have 1 great student"
    else
        puts "Overall, we have #{names.count} great students"
    end
end

students = input_students
print_header
print_names(students)
print_footer(students)