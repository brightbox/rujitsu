module RujitsuObject
  # return true if this object is within the given container
  # if the supplied container does not respond to include? then an equality test is used instead
  def in? container
    container.respond_to?(:include?) ? container.include?(self) : container == self
  end
end

Object.send(:include, RujitsuObject)
