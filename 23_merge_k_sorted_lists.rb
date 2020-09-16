# Leetcode problem: https://leetcode.com/problems/merge-k-sorted-lists/
# You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.
#
# Merge all the linked-lists into one sorted linked-list and return it.
#
#
#
# Example 1:
#
# Input: lists = [[1,4,5],[1,3,4],[2,6]]
# Output: [1,1,2,3,4,4,5,6]
# Explanation: The linked-lists are:
# [
#   1->4->5,
#   1->3->4,
#   2->6
# ]
# merging them into one sorted list:
# 1->1->2->3->4->4->5->6
# Example 2:
#
# Input: lists = []
# Output: []
# Example 3:
#
# Input: lists = [[]]
# Output: []
#
#
# Constraints:
#
# k == lists.length
# 0 <= k <= 10^4
# 0 <= lists[i].length <= 500
# -10^4 <= lists[i][j] <= 10^4
# lists[i] is sorted in ascending order.
# The sum of lists[i].length won't exceed 10^4.
#-----------------------------------------------------------------------------------------------------------------------
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
require_relative 'core/linked_list'

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

  while !l1.nil? || !l2.nil?
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

until head.nil?
  p head.val
  head = head.next
end
