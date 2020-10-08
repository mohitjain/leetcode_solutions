# Leetcode Problem: https://leetcode.com/problems/sum-of-left-leaves/
#Find the sum of all left leaves in a given binary tree.
#
# Example:
#
#     3
#    / \
#   9  20
#     /  \
#    15   7
#
# There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.
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
# @return {Integer}
require_relative 'core/binary_tree'
require_relative 'core/queue'
def sum_of_left_leaves(root)
  sum = 0
  return sum if root.nil?

  queue = Queue.new
  queue.enqueue root
  until queue.empty?
    node = queue.dequeue
    left = node.left
    right = node.right
    # val.nil? check is because of bug in binary tree implementation.
    if !left.nil? && (left.left.nil? || left.left.val.nil?) && (left.right.nil? || left.right.val.nil?)
      sum += left.val.to_i
    end
    queue.enqueue(left)  unless left.nil?
    queue.enqueue(right) unless right.nil?
  end

  sum

end

tree = BinaryTree.new [3, 9, 20, nil, nil, 15, 7]
p sum_of_left_leaves tree.root
