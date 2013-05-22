require_relative 'Patient'
require 'csv'

class Patients
  def initialize
    @patients = []
    init_read_patients_csv('patients.csv')
  end

  def init_read_patients_csv(file)
    CSV.foreach(file) do |id, last_name, first_name, age, reason|
      @patients << Patient.new({:id => id, :last_name => last_name, :first_name => first_name, :age => age, :reason => reason})
    end
  end

  def patient_array_access
    @patients
  end

  def view_patient_list
    @patients.each do |patient|
      puts patient.display
    end
  end

  def add_new_patient(first_name, last_name, age, reason)
    new_id = @patients.count + 1
    @patients << Patient.new({:id => new_id, :last_name => last_name, :first_name => first_name, :age => age, :reason => reason})
    save_current_patients_to_file
  end

  def save_current_patients_to_file
    CSV.open('patients.csv', 'w') do |csv|
      @patients.each do |patient|
        csv << patient.to_a
      end
    end
  end

end