# Leetcode problem: https://leetcode.com/problems/merge-k-sorted-lists/

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode[]} lists
# @return {ListNode}
require_relative "core/linked_list"

def merge_k_lists(lists)
  interval = 1
  while interval < lists.length
     for i in (0..(lists.length - 1 - interval)).step(interval*2) do
        lists[i] = merge_two_lists(lists[i], lists[i + interval])
     end
     interval = interval * 2
  end
  lists.first
end

def merge_two_lists(l1, l2)
  return l2 if l1.nil?
  return l1 if l2.nil?
  head = nil
  previous_node = nil

  while(!l1.nil? || !l2.nil?)
    node = ListNode.new
    if l1.nil?
      node.val = l2.val
      l2 = l2.next
    elsif l2.nil?
      node.val = l1.val
      l1 = l1.next
    elsif l1.val > l2.val
      node.val = l2.val
      l2 = l2.next
    else
      node.val = l1.val
      l1 = l1.next
    end
    if head.nil?
      head = node
    else
      previous_node.next = node
    end
    previous_node = node
  end
  head
end

list1 = LinkedList.new([1,4,5])
list1.to_s
list2 = LinkedList.new([1,3,4])
list2.to_s

list3 = LinkedList.new([2,6])
list3.to_s

head = merge_k_lists([list1.head, list2.head, list3.head])

while !head.nil?
  p head.val
  head = head.next
end
