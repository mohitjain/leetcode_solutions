require_relative 'core/linked_list'
require('pry')
# Leetcode problem https://leetcode.com/problems/merge-two-sorted-lists/
# Definition for singly-linked list.
# class ListListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListListNode} l1
# @param {ListListNode} l2
# @return {ListListNode}
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

list1 = LinkedList.new([1,2,4])
list1.to_s
list2 = LinkedList.new([1,3,4])
list2.to_s
head = merge_two_lists(list1.head, list2.head)

while !head.nil?
  p head.val
  head = head.next
end
