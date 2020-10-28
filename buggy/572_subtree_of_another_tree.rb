# Leetcode Problem: https://leetcode.com/problems/subtree-of-another-tree/
#Given two non-empty binary trees s and t, check whether tree t has exactly the same structure and node values with a subtree of s. A subtree of s is a tree consists of a node in s and all of this node's descendants. The tree s could also be considered as a subtree of itself.
#
# Example 1:
# Given tree s:
#
#      3
#     / \
#    4   5
#   / \
#  1   2
#
# Given tree t:
#
#    4
#   / \
#  1   2
#
# Return true, because t has the same structure and node values with a subtree of s.
#
#
#
# Example 2:
# Given tree s:
#
#      3
#     / \
#    4   5
#   / \
#  1   2
#     /
#    0
#
# Given tree t:
#
#    4
#   / \
#  1   2
#
# Return false.
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
# @param {TreeNode} s
# @param {TreeNode} t
# @return {Boolean}
def is_subtree(s, t)
  traverse(s, t)
end

def equals(s, t)
  return true if s.nil? && t.nil?
  return false if s.nil? || t.nil?

  (x.val == y.val) && equals(s.left, t.left) && equals(s.right, t.right)
  # code here
end

def traverse(s, t)
  !s.nil? && (equals(s.left, t) || equals(s.right, t) || equals(s, t))
end