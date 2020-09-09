require_relative 'linked_list'

class DoublyNode < Node
  attr_accessor :previous
end

class DoublyLinkedList < LinkedList

  def append(value)
    node = DoublyNode.new(value)
    if head.nil?
      self.head = node
    else
      current_tail_node = tail
      current_tail_node.next = node
      node.previous = current_tail_node
    end
    node
  end

  def remove(value)
    current_node = head
    while(!current_node.nil?)
      if current_node.value == value
        if current_node.previous.nil?
          self.head = current_node.next
        elsif current_node.next.nil?
          current_node.previous.next = nil
        else
          current_node.previous.next = current_node.next
        end
        break
      else
        current_node = current_node.next
      end
    end
  end

  def remove_last
    last_node = tail
    return if tail.nil? or tail.previous.nil?
    tail.previous.next = nil
  end
  def append_at_start(value)
    node = DoublyNode.new(value)
    node.next = head
    self.head.previous = node unless self.head.nil?
    self.head = node
    node
  end

  def to_s
    p nodes.collect(&:value).join("<->")
  end

end
