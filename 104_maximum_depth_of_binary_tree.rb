# Leetcode Problem: https://leetcode.com/problems/maximum-depth-of-binary-tree/
#Given a binary tree, find its maximum depth.
#
# The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
#
# Note: A leaf is a node with no children.
#
# Example:
#
# Given binary tree [3,9,20,null,null,15,7],
#
#     3
#    / \
#   9  20
#     /  \
#    15   7
#
# return its depth = 3.
# ---------------------------------------------------------------------------------------------------------------------
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
def max_depth(root)
  return 0 if root.nil?
  1 + [max_depth(root.left), max_depth(root.right)].max
end

tree_1 = BinaryTree.new [3, 9, 20, nil, nil, 15, 7]
p max_depth tree_1.root
