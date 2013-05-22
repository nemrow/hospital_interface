require 'csv'
# require_relative 'Employee'
require_relative 'Employee'


class Employees
  def initialize
    @employees = []
    init_read_employee_csv('employees.csv')
  end

  def init_read_employee_csv(file)
    CSV.foreach(file) do |id, last_name, first_name, email, password, position|
      @employees << Employee.new({:id => id, :last_name => last_name, :first_name => first_name, :email => email, :password => password, :position => position})
    end
  end

  def employee_array_access
    @employees
  end

  def find_employee_by_email(email)
    @employees.detect do  |obj|
      obj.email == email
    end
  end

  def view_employees_list
    @employees.each do |employee|
      puts employee.display
    end
  end

end

# test = Employees.new
# p test.find_employee_by_email("nemrowj@gmail.com")