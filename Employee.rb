class Employee
  def initialize(employee)
    @id = employee[:id]
    @last_name = employee[:last_name]
    @first_name = employee[:first_name]
    @email = employee[:email]
    @password = employee[:password]
    @position = employee[:position]
  end
end
