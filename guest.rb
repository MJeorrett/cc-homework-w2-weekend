require_relative('record')

class Guest < Record

  attr_reader :first_name, :last_name, :date_of_birth, :confidence

  def initialize(first_name, last_name, date_of_birth, confidence)
    @first_name = first_name
    @last_name = last_name
    @date_of_birth = date_of_birth
    @confidence = confidence
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def age()
    now = Time.now.to_date()
    year_difference = now.year - @date_of_birth.year
    birthday_month_past = now.month > @date_of_birth.month
    in_birthday_month_and_date_past = now.month == @date_of_birth && now.day >= @date_of_birth.day
    if birthday_month_past || in_birthday_month_and_date_past
      subtract_year = 0
    else
      subtract_year = 1
    end

    return year_difference - subtract_year
  end

  def year_turned_16()
    return @date_of_birth.year + 16
  end

end
