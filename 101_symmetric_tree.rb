# Leetcode Problem: https://leetcode.com/problems/symmetric-tree/
#Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
#
# For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
#
#     1
#    / \
#   2   2
#  / \ / \
# 3  4 4  3
#
#
#
# But the following [1,2,2,null,3,null,3] is not:
#
#     1
#    / \
#   2   2
#    \   \
#    3    3
#
#
#
# Follow up: Solve it both recursively and iteratively.
#
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
# @return {Boolean}
require_relative 'core/binary_tree'
def is_symmetric(root)
  return true if root.nil?

  symmetric?(root.left, root.right)
end

def symmetric? left, right
  return left == right if left.nil? || right.nil?

  return false if left.val != right.val

  symmetric?(left.left, right.right) && symmetric?(left.right, right.left)
end

tree = BinaryTree.new [1, 2, 2, 3, 4, 4, 3]
p is_symmetric(tree.root)
tree = BinaryTree.new [1, 2, 2, nil, 3, nil, 3]
p is_symmetric(tree.root)
