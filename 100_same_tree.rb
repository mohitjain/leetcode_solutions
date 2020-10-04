# Leetcode Problem: https://leetcode.com/problems/same-tree/
#Given two binary trees, write a function to check if they are the same or not.
#
# Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
#
# Example 1:
#
# Input:     1         1
#           / \       / \
#          2   3     2   3
#
#         [1,2,3],   [1,2,3]
#
# Output: true
#
# Example 2:
#
# Input:     1         1
#           /           \
#          2             2
#
#         [1,2],     [1,null,2]
#
# Output: false
#
# Example 3:
#
# Input:     1         1
#           / \       / \
#          2   1     1   2
#
#         [1,2,1],   [1,1,2]
#
# Output: false
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
# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
require_relative 'core/binary_tree'
def is_same_tree(p, q)
  if p.nil? && q.nil?
    return true
  elsif p.nil? || q.nil?
    return false
  elsif p.val != q.val
    return false
  else
    return is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
  end
end

tree_1 = BinaryTree.new [1, 2, 3]
tree_2 = BinaryTree.new [1, 2, 3]
p is_same_tree(tree_1.root, tree_2.root)

tree_1 = BinaryTree.new [1, 2]
tree_2 = BinaryTree.new [1, nil, 2]
p is_same_tree(tree_1.root, tree_2.root)