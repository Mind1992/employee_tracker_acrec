require 'spec_helper'

describe Division do
  it "has many employees" do
    division = Division.create({:name => 'Accounting'})
    employee1 = Employee.create({:name => 'Josh', :division_id => division.id})
    employee2 = Employee.create({:name => 'Bob', :division_id => division.id})
    expect(division.employees).to eq [employee1, employee2]
  end
end
