class Hospital
  attr_reader :name
  def initialize(name)
    @hospital_name = name
  end

  def get_name
    @hospital_name
  end
end