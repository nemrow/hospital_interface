require 'Hospital'
require 'Employees'
require 'Patients'

class Init
  def initialize
    @hospital = create_hospital
    @employees = generate_employee_list
    @patients = generate_patient_list
  end

  def create_hospital
    Hospital.new("Nemrow Hospital")
  end

  def access_employees
    @employees
  end

  def access_patients
    @patients
  end

  def generate_employee_list
    Employees.new.employee_array_access
  end

  def generate_patient_list
    Patients.new.patient_array_access
  end
end

begin_login = Init.new
p begin_login.access_employees
p begin_login.access_patients