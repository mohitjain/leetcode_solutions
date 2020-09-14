require 'pry'
require_relative 'heap'
class MinHeap < Heap

  private

  def fix_violated_property
    current = size
    while (heap[current] < heap[parent(current)]) do
      swap(current, parent(current))
      current = parent(current)
    end
  end

  def heapify(position)
    return if is_leaf?(position)

    greater_than_left_child = !heap[left_child(position)].nil? && heap[position] > heap[left_child(position)]
    greater_than_right_child = !heap[right_child(position)].nil? && heap[position] > heap[right_child(position)]
    if greater_than_left_child || greater_than_right_child

      if greater_than_left_child && greater_than_right_child
        if heap[left_child(position)] < heap[right_child(position)]
          swap(position, left_child(position))
          heapify(left_child(position))
        else
          swap(position, right_child(position))
          heapify(right_child(position))
        end
      elsif greater_than_left_child
        swap(position, left_child(position))
        heapify(left_child(position))
      else
        swap(position, right_child(position))
        heapify(right_child(position))
      end
    end
  end

end

heap = MinHeap.new 1
heap.insert 5
heap.insert 7
heap.to_s
heap.insert 11
heap.to_s
heap.insert 1
heap.to_s
heap.insert 2
heap.to_s

heap.insert -1
heap.to_s

p heap.remove
heap.to_s

p heap.remove
heap.to_s


p heap.remove
heap.to_s


p heap.remove
heap.to_s
