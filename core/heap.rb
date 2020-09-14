require 'pry'
require 'pry-nav'
class Heap

  def initialize(max_size)
    self.max_size = max_size
    self.size = 0
    self.heap = Array.new(max_size + 1)
  end

  def insert(element)
    heap[size] = element
    fix_violated_property
    self.size = size + 1
    drop_last_element_if_overflow
  end

  def remove
    output = heap.first
    heap[0] = nil
    swap(0, size - 1)
    heapify(0)
    self.size = size - 1 if self.size >= 0
    output
  end

  def to_s
    p heap
  end

  private

  attr_accessor :max_size, :size, :heap

  def drop_last_element_if_overflow
    return if size <= max_size
    self.heap[size - 1] = nil
    self.size = size - 1
  end

  def parent(position)
    position / 2
  end

  def left_child(position)
    position * 2 + 1
  end

  def right_child(position)
    position * 2 + 2
  end

  def fix_violated_property
    raise "Implement this based up min heap or max heap"
  end

  def swap(current_position, new_position)
    current_element = heap[current_position]
    self.heap[current_position] = heap[new_position]
    self.heap[new_position] = current_element
  end

  def is_leaf?(position)
    return true if position > (size / 2) && position <= size

    false
  end

  def heapify(position)
    raise "Implement this based upon max heap or min heap"
  end

end
