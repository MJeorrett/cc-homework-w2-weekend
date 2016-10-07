require_relative('record')

class Guest < Record

  attr_reader :first_name, :last_name, :id

  def initialize(first_name, last_name, id)
    @first_name = first_name
    @last_name = last_name
    @id = id
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

end
