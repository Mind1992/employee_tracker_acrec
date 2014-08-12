require 'active_record'
require './lib/employee'
require './lib/division'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def main_menu
  user_input = nil
  until user_input == '0'
    puts "1: add employee"
    puts "2: list all the employees"
    puts "3: add division"
    puts "4: list all the divisions"
    puts "0: exit"
    user_input = gets.chomp
    case user_input
      when "1" then add_employee
      when "2" then list_employees
      when "3" then add_division
      when "4" then list_divisions
      when "0" then exit
      else
        puts "There is no such command"
    end
  end
end

def add_employee
  puts "\n\n"
  print "Type in the employee's name: "; employee_name = gets.chomp
  employee = Employee.new({:name => employee_name})
  employee.save
  puts "* '#{employee_name}' * has been added to the system."
  puts "Add the employee to a division: "

end

def list_employees
  puts "\n\n"
  puts "Here are all the employees: "
  counter = 1;
  Employee.all.each do |employee|
    puts "#{counter.to_s}. #{employee.name}"
    counter += 1
  end
  puts "\n\n"
end

def add_division
  puts "\n\n"
  print "Type in the division's name: "; division_name = gets.chomp
  division = Division.new({:name => division_name})
  division.save
  puts "* '#{division_name} * has been added to the system"
end

def list_divisions
  puts "\n\n"
  puts "Here are all the divisions: "
  counter = 1;
  Division.all.each do |division|
    puts "#{counter.to_s}. #{division.name}"
    counter += 1
  end
  puts "\n\n"
end


main_menu
