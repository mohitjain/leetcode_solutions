# Leetcode Problem: https://leetcode.com/problems/add-two-numbers/
# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
#
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.
#
# Example:
#
# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.
# ----------------------------------------------------------------------------------------------------------------------

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
def add_two_numbers(l1, l2)
  head = nil
  previous_node = nil
  carry = 0
  while !l1.nil? || !l2.nil?
    first = l1.nil? ? 0 : l1.val
    second = l2.nil? ? 0 : l2.val
    sum = first + second + carry
    value = sum % 10
    carry = sum / 10
    node = ListListNode.new(value)

    head = node if head.nil?
    if previous_node.nil?
      previous_node = node
    else
      previous_node.next = node
      previous_node = node
    end

    l1 = l1.next unless l1.nil?
    l2 = l2.next unless l2.nil?
  end

  if carry.positive?
    node = ListListNode.new(carry)
    previous_node.next = node
  end

  head
end

# You can run this on leet code or
# feel free to create a linkedlist with node's next added properly
# to run it on your local machine.