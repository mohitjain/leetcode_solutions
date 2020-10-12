class Stack
  def initialize(data = nil)
    @data = data || []
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
    @data.first
  end

  def size
    @data.length
  end

  def to_array
    @data
  end

  def to_s
    @data.join("-")
  end
end

#
# stack = Stack.new
# stack.push 1
# stack.push 2
# stack.push 3
#
# p stack.pop
# p stack.pop