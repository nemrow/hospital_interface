class Employee
  attr_reader :id, :last_name, :first_name, :email, :position, :password
  def initialize(employee)
    @id = employee[:id]
    @last_name = employee[:last_name]
    @first_name = employee[:first_name]
    @email = employee[:email]
    @password = employee[:password]
    @position = employee[:position]
  end

  def display
    "Id: #{@id}, last name: #{@last_name}, first name: #{@first_name}, position: #{@position}"
  end

  def to_a
    [@id, @last_name, @first_name, @email, @password, @position]
  end
end
