module RujitsuDate

  def start_of_this_month
    today = self.today
    self.new(today.year, today.month)
  end

  def start_of_last_month
    today = self.today
    self.new(today.year, today.month - 1)
  end

  def start_of_next_month
    today = self.today
    if today.month <= 12
      self.new(today.year, today.month + 1)
    else
      self.new(today.year + 1, 1)
    end
  end

end

Date.send(:extend, RujitsuDate)