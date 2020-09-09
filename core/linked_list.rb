class ListNode
  attr_accessor :val, :next

  def initialize(val = nil)
    self.val = val
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

  def append(val)
    node = ListNode.new(val)
    if head.nil?
      self.head = node
    else
      tail.next = node
    end
    node
  end

  def find(val)
    current_node = head
    while(current_node.nil?)
      return current_node if current_node.val == val
      current_node = current_node.next
    end
  end

  def print
    nodes.each do |node|
      puts node.val
    end
  end

  def to_s
    p nodes.collect(&:val).join("->")
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
