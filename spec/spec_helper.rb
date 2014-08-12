require 'active_record'
require 'rspec'
require 'employee'
require 'division'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

Rspec.configure do |config|
  config.after(:each) do
    Employee.all.each { |employee| employee.destroy }
  end
end
