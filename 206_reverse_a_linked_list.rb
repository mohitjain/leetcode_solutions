# Leetcode Problem: https://leetcode.com/problems/reverse-linked-list/
#Reverse a singly linked list.
#
# Example:
#
# Input: 1->2->3->4->5->NULL
# Output: 5->4->3->2->1->NULL
#
# Follow up:
#
# A linked list can be reversed either iteratively or recursively. Could you implement both?
#
#-----------------------------------------------------------------------------------------------------------------------
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
#
# --------------------------- USING STACK ------------------------------------------------------------------------------
# require_relative 'core/linked_list'
# require_relative 'core/stack'
# def reverse_list(head)
#   stack = Stack.new
#   until head.nil?
#     stack.push head
#     head = head.next
#   end
#
#   head = nil
#   current = nil
#   until stack.empty?
#     node = stack.pop
#     if head.nil?
#       head = node
#       current = node
#     else
#       current.next = node
#       current = current.next
#     end
#   end
#   head
# end

def reverse_list(head)
  current = head
  previous = nil
  until current.nil?
    next_element = current.next
    current.next = previous
    previous = current
    current = next_element
  end
  previous
end

list = LinkedList.new([1, 2, 3, 4, 5])
p reverse_list(list.head)
