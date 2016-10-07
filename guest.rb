require_relative('record')

class Guest < Record

  attr_reader :first_name, :last_name, :date_of_birth

  def initialize(first_name, last_name, date_of_birth)
    @first_name = first_name
    @last_name = last_name
    @date_of_birth = date_of_birth
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

end
