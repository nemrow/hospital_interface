require 'CSV'
require 'Employee'

class Employees
  def initialize
    @employees = []
    init_read_employee_csv('employees.csv')
  end

  def init_read_employee_csv(file)
    CSV.foreach(file) do |id, last_name, first_name, email, password, position|
      @employees << Employee.new({:id => id, :last_name => last_name, :first_name => first_name, :email => email, :password => password, :position => position})
      p [last_name, first_name, email, password, position]
    end
  end

  def employee_array_access
    @employees
  end

end

# test = Employees.new
# p test.employee_array_access