class Patient
  def initialize(patient)
    @id = patient[:id]
    @last_name = patient[:last_name]
    @first_name = patient[:first_name]
    @age = patient[:age]
    @reason = patient[:reason]
  end

  def display
    "Id: #{@id}, last name: #{@last_name}, first name: #{@first_name}, reason here: #{@reason}"
  end
end