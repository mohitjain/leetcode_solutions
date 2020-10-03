# Leetcode Problem: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
#Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST.
#
# According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”
#
# Given binary search tree:  root = [6,2,8,0,4,7,9,null,null,3,5]
#
#
#
# Example 1:
#
# Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
# Output: 6
# Explanation: The LCA of nodes 2 and 8 is 6.
#
# Example 2:
#
# Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
# Output: 2
# Explanation: The LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.
#
#
#
# Constraints:
#
#     All of the nodes' values will be unique.
#     p and q are different and both values will exist in the BST.
# ----------------------------------------------------------------------------------------------------------------------
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
require_relative 'core/binary_tree'
def lowest_common_ancestor(root, p, q)
  return if root.nil?

  if p.val > root.val && q.val > root.val
    lowest_common_ancestor root.right, p, q
  elsif p.val < root.val && q.val < root.val
    lowest_common_ancestor root.left, p, q
  else
    root
  end
end

tree = BinaryTree.new([6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5])
p = tree.find(2)
q = tree.find 8
p lowest_common_ancestor tree.root, p, q
p = tree.find 2
q = tree.find 4
p lowest_common_ancestor tree.root, p, q
