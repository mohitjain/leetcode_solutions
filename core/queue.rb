class Queue
  def initialize(data = nil)
    @data = data || []
  end

  def enqueue(item)
    @data << item
  end

  def dequeue
    @data.shift
  end

  def empty?
    @data.empty?
  end

  def front
    @data.first
  end

  def tail
    @data.last
  end

  def to_s
    @data.join("-")
  end

  def data
    @data
  end
end
