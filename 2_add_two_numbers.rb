# Leetcode Problem: https://leetcode.com/problems/add-two-numbers/
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
  while(!l1.nil? || !l2.nil?)
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

    l1 = l1.next if !l1.nil?
    l2 = l2.next if !l2.nil?
  end

  if carry > 0
    node = ListListNode.new(carry)
    previous_node.next = node
  end

  head
end

# You can run this on leet code or
# feel free to create a linkedlist with node's next added properly
# to run it on your local machine.