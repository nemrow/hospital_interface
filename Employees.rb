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

  def add_new_employee(last_name, first_name, email, password, position)
    new_id = @employees.count + 1
    @employees << Employee.new({:id => new_id, :last_name => last_name, :first_name => first_name, :email => email, :password => password, :position => position})
    save_current_employees_to_file
  end

  def save_current_employees_to_file
    CSV.open('employees.csv', 'w') do |csv|
      @employees.each do |employee|
        csv << employee.to_a
      end
    end
  end

end

# test = Employees.new
# test.save_current_employees_to_file
# p test.view_employees_list
# p test.find_employee_by_email("nemrowj@gmail.com")