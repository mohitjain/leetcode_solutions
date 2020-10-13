# Leetcode Problem: https://leetcode.com/problems/palindrome-linked-list/
# Given a singly linked list, determine if it is a palindrome.
#
# Example 1:
#
# Input: 1->2
# Output: false
#
# Example 2:
#
# Input: 1->2->2->1
# Output: true
#
# Follow up:
# Could you do it in O(n) time and O(1) space?
# ----------------------------------------------------------------------------------------------------------------------
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Boolean}
require_relative '../core/linked_list'
def is_palindrome(head)
  slow_pointer = head
  fast_pointer = head

  while !fast_pointer.nil? && !fast_pointer.next.nil?
    slow_pointer = slow_pointer.next
    fast_pointer = fast_pointer.next.next
  end

  mid = fast_pointer.nil? ? slow_pointer : slow_pointer.next

  # Reverse second half

  previous = nil
  new_head = mid

  until new_head.nil?
    next_element = new_head.next
    new_head.next = previous
    previous = new_head
    new_head = next_element
  end


  while !previous.nil? && !head.nil?
    return false if previous.val != head.val

    previous = previous.next
    head = head.next
  end

  true

end

list = LinkedList.new [1, 2]
is_palindrome list.head
list = LinkedList.new [1, 2, 2, 1]