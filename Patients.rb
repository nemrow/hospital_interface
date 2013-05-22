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
      p patient.display
    end
  end

end