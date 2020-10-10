# Leetcode Problem: https://leetcode.com/problems/validate-binary-search-tree/
#Given a binary tree, determine if it is a valid binary search tree (BST).
#
# Assume a BST is defined as follows:
#
#     The left subtree of a node contains only nodes with keys less than the node's key.
#     The right subtree of a node contains only nodes with keys greater than the node's key.
#     Both the left and right subtrees must also be binary search trees.
#
#
#
# Example 1:
#
#     2
#    / \
#   1   3
#
# Input: [2,1,3]
# Output: true
#
# Example 2:
#
#     5
#    / \
#   1   4
#      / \
#     3   6
#
# Input: [5,1,4,null,null,3,6]
# Output: false
# Explanation: The root node's value is 5 but its right child's value is 4.
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
# @return {Boolean}
require_relative 'core/binary_tree'
def is_valid_bst(root)
  validate root, nil, nil
end

def validate(root, max, min)
  return true if root.nil? || root.val.nil?
  return false if !root.val.nil? && !max.nil? && root.val >= max # root.val.nil? check is there because of bug in binary tree implementation
  return false if !root.val.nil? && !min.nil? && root.val <= min

  validate(root.left, root.val, min) &&  validate(root.right, max, root.val)

end

tree = BinaryTree.new [2, 1, 3]
p is_valid_bst(tree.root)
tree = BinaryTree.new [5, 1, 4, nil, nil, 3, 6]
p is_valid_bst(tree.root)
