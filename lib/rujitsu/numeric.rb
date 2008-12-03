class Numeric
  # convert float values to "cents"
  #   my_value = 2.5
  #   my_value.to_cents # => 250
  def to_cents
    (self * 100.0).to_i
  end
end
