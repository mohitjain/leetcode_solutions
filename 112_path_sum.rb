# Leetcode Problem: https://leetcode.com/problems/path-sum/
#Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.
#
# Note: A leaf is a node with no children.
#
# Example:
#
# Given the below binary tree and sum = 22,
#
#       5
#      / \
#     4   8
#    /   / \
#   11  13  4
#  /  \      \
# 7    2      1
#
# return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.
#-----------------------------------------------------------------------------------------------------------------------
require_relative 'core/binary_tree'

def has_path_sum(root, sum)
  return false if root.nil? || root.val.nil?
  return true if root.left.nil? && root.right.nil? && (root.val == sum)

  has_path_sum(root.left, sum - root.val) || has_path_sum(root.right, sum - root.val)
end

tree = BinaryTree.new([5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, nil, 1])
p has_path_sum tree.root, 22
