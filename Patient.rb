class Patient
  def initialize(patient)
    @id = patient[:id]
    @last_name = patient[:last_name]
    @first_name = patient[:first_name]
    @email = patient[:age]
    @password = patient[:reason]
  end
end