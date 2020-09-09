require_relative 'linked_list'

class DoublyListNode < ListNode
  attr_accessor :previous
end

class DoublyLinkedList < LinkedList

  def append(val)
    node = DoublyListNode.new(val)
    if head.nil?
      self.head = node
    else
      current_tail_node = tail
      current_tail_node.next = node
      node.previous = current_tail_node
    end
    node
  end

  def remove(val)
    current_node = head
    while(!current_node.nil?)
      if current_node.val == val
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
  def append_at_start(val)
    node = DoublyListNode.new(val)
    node.next = head
    self.head.previous = node unless self.head.nil?
    self.head = node
    node
  end

  def to_s
    p nodes.collect(&:val).join("<->")
  end

end
