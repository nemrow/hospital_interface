require_relative 'Hospital'
require_relative 'Employees'
require_relative 'Patients'

class Init
  attr_reader :employees
  def initialize
    @hospital = create_hospital
    @employees = read_employees
    @patients = read_patients
    begin_session
  end

  def begin_session
    puts "Welcome to #{@hospital.get_name}"
    puts "~"*20
    validate_user
  end

  def validate_user
    puts "please enter your email"
    user_email = gets.chomp
    user_object = @employees.find_employee_by_email(user_email)
    puts "Please enter password"
    user_password = gets.chomp
    if user_password == user_object.password
      puts "You're in! You're access level is #{user_object.position}"
      access_program
    else
      puts "Wrong password"
    end
  end

  def access_program
    input = nil
    while input != ""
      puts "
What would you like to do?\n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n
1. View patients\n
2. View employess\n
3. Add patient\n
4, Add employee\n"
      input = gets.chomp
      case input
      when "1"
        puts "Patients\n#{'~'*80}"
        @patients.view_patient_list
      when "2"
        puts "Employees\n#{'~'*80}"
        @employees.view_employees_list
      when "3"
        run_add_patient
      when "4"
        run_add_employee
      end
    end
  end

  def run_add_employee
    puts "Add an employee!"
    puts "~"*80+"\n"
    puts "First Name?"
    first_name_input = gets.chomp
    puts "Last Name?"
    last_name_input = gets.chomp
    puts "Email Address?"
    email_input = gets.chomp
    puts "Password?"
    password_input = gets.chomp
    puts "Position?"
    position_input = gets.chomp
    @employees.add_new_employee(first_name_input, last_name_input, email_input, password_input, position_input)
    puts "New Employee List"
    puts "~"*80
    @employees.view_employees_list
  end

  def run_add_patient
    puts "Add an patient!"
    puts "~"*80+"\n"
    puts "First Name?"
    first_name_input = gets.chomp
    puts "Last Name?"
    last_name_input = gets.chomp
    puts "age?"
    age_input = gets.chomp
    puts "Reason?"
    reason_input = gets.chomp
    @patients.add_new_patient(first_name_input, last_name_input, age_input, reason_input)
    puts "New Employee List"
    puts "~"*80
    @patients.view_patient_list
  end

  def create_hospital
    Hospital.new("Nemrow Hospital")
  end

  def read_employees
    Employees.new
  end

  def read_patients
    Patients.new
  end
end

begin_login = Init.new
