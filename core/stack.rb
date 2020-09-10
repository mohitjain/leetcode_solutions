class Stack
  def initialize(data = nil)
    @data = data || nil
  end

  def push(element)
    @data.push element
  end

  def pop
    @data.pop
  end

  def empty?
    @data.empty?
  end

  def top
    @data.last
  end

  def bottom
    @data.firstx
  end

  def to_s
    @data.join("-")
  end
end