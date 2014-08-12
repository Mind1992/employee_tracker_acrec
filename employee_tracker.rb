require 'active_record'
require './lib/employee'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def main_menu
  user_input = nil
  until user_input == '0'
    puts "1: add employee"
    puts "0: exit"
    user_input = gets.chomp
    case user_input
      when "1" then add_employee
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
end


main_menu
