# Leetcode problem: https://leetcode.com/problems/copy-list-with-random-pointer/solution/
# A linked list is given such that each node contains an additional random pointer which could point to any node in the list or null.
#
# Return a deep copy of the list.
#
# The Linked List is represented in the input/output as a list of n nodes. Each node is represented as a pair of [val, random_index] where:
#
#     val: an integer representing Node.val
#     random_index: the index of the node (range from 0 to n-1) where random pointer points to, or null if it does not point to any node.
#
#
#
# Example 1:
#
# Input: head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
# Output: [[7,null],[13,0],[11,4],[10,2],[1,0]]
#
# Example 2:
#
# Input: head = [[1,1],[2,1]]
# Output: [[1,1],[2,1]]
#
# Example 3:
#
# Input: head = [[3,null],[3,0],[3,null]]
# Output: [[3,null],[3,0],[3,null]]
#
# Example 4:
#
# Input: head = []
# Output: []
# Explanation: Given linked list is empty (null pointer), so return null.
#
#
#
# Constraints:
#
#     -10000 <= Node.val <= 10000
#     Node.random is null or pointing to a node in the linked list.
#     The number of nodes will not exceed 1000.
# ----------------------------------------------------------------------------------------------------------------------
# Definition for Node.
# class Node
#     attr_accessor :val, :next, :random
#     def initialize(val = 0)
#         @val = val
#		  @next = nil
#		  @random = nil
#     end
# end

# @param {Node} node
# @return {Node}
def copyRandomList(head)
  return nil if head.nil?

  data = {}
  new_head = Node.new(head.val)
  data[head] = new_head
  current_node = head.next
  current_new_node = new_head
  until current_node.nil?
    new_node = Node.new(current_node.val)
    data[current_node] = new_node
    current_new_node.next = new_node
    current_new_node = current_new_node.next
    current_node = current_node.next
  end

  new_current = new_head
  until head.nil?
    unless head.random.nil?
      new_current.random = data[head.random]
    end
    head = head.next
    new_current = new_current.next
  end

  new_head
end