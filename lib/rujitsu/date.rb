module RujitsuDate

  def start_of_this_month
    today = self.today
    self.new(today.year, today.month)
  end

  def start_of_last_month
    today = self.today
    self.new(today.year, today.month) - 1.month
  end

  def start_of_next_month
    today = self.today
    self.new(today.year, today.month) + 1.month
  end

end

Date.send(:extend, RujitsuDate)