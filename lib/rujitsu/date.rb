module RujitsuDate

  def self.start_of_this_month
    today = self.today
    self.new (today.year, today.month)
  end

  def self.start_of_last_month
    today = self.today
    self.new (today.year, today.month) - 1.month
  end

  def self.start_of_next_month
    today = self.today
    self.new (today.year, today.month) + 1.month
  end

end

Date.send(:include, RujitsuDateTime)