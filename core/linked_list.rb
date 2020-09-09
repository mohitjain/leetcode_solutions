class Node
  attr_accessor :value, :next

  def initialize(value)
    self.value = value
  end
end

class LinkedList
  attr_accessor :head

  def initialize(data = nil)
    self.head = nil
    if data.is_a? Array
      data.each do |item|
        self.append item
      end
    end
  end

  def append(value)
    node = Node.new(value)
    if head.nil?
      self.head = node
    else
      tail.next = node
    end
    node
  end

  def find(value)
    current_node = head
    while(current_node.nil?)
      return current_node if current_node.value == value
      current_node = current_node.next
    end
  end

  def print
    nodes.each do |node|
      puts node.value
    end
  end

  def to_s
    p nodes.collect(&:value).join("->")
  end

   def tail
    node = head
    return nil if node.nil?
    return node if node.next.nil?

    while !node.next.nil?
      node = node.next
    end

    node
  end

  private

  def nodes
    output = []
    return output if head.nil?
    node = head
    output.push node
    while !node.next.nil?
      node = node.next
      output.push node
    end
    output
  end


end
