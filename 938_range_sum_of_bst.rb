# Leetcode Problem: https://leetcode.com/problems/range-sum-of-bst/
#Given the root node of a binary search tree, return the sum of values of all nodes with value between L and R (inclusive).
#
# The binary search tree is guaranteed to have unique values.
#
#
#
# Example 1:
#
# Input: root = [10,5,15,3,7,null,18], L = 7, R = 15
# Output: 32
#
# Example 2:
#
# Input: root = [10,5,15,3,7,13,18,1,null,6], L = 6, R = 10
# Output: 23
#
#
#
# Note:
#
#     The number of nodes in the tree is at most 10000.
#     The final answer is guaranteed to be less than 2^31.
# ----------------------------------------------------------------------------------------------------------------------
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer} l
# @param {Integer} r
# @return {Integer}
require_relative 'core/binary_tree'
require_relative 'core/queue'
def range_sum_bst(root, l, r)
  sum = 0
  return sum if root.nil?

  queue = Queue.new
  queue.enqueue root

  until queue.empty?
    node = queue.dequeue
    next if node.val.nil? # Its a bug in Binary tree implementation

    if node.val >= l && node.val <= r
      sum += node.val
    end
    queue.enqueue(node.left) if !node.left.nil? && node.val > l
    queue.enqueue(node.right) if !node.right.nil? && node.val < r
  end

  sum
end

tree = BinaryTree.new [10, 5, 15, 3, 7, nil, 18]
p range_sum_bst tree.root, 7, 15

tree = BinaryTree.new [10, 5, 15, 3, 7, 13, 18, 1, nil, 6]
p range_sum_bst tree.root, 6, 10
