class Record

  def ==(other)
    classes_match = other.class == self.class
    variables_match = other.state == self.state
    return classes_match && variables_match
  end

  protected

  def state
    self.instance_variables().sort().map do |variable|
      self.instance_variable_get(variable)
    end
  end

end
