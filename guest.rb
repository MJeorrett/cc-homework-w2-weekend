require_relative('record')

class Guest < Record

  attr_reader :first_name, :last_name, :date_of_birth, :confidence, :at_bar

  def initialize(params)
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @date_of_birth = params[:date_of_birth]
    @confidence = params[:confidence].to_f
    @at_bar = false
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

  def desire_to_sing(song)
    turned_16_offset = (song.release_year() - year_turned_16()).abs
    return 100 - turned_16_offset + confidence
  end

  def leave_bar()
    at_bar = false
  end

  def boost_confidence(amount)
    @confidence += amount
  end

  def get_description()
    return "#{full_name()}(#{year_turned_16()}, #{@confidence.round(1)})"
  end

end
