# Leetcode Problem: https://leetcode.com/problems/binary-tree-paths/
#Given a binary tree, return all root-to-leaf paths.
#
# Note: A leaf is a node with no children.
#
# Example:
#
# Input:
#
#    1
#  /   \
# 2     3
#  \
#   5
#
# Output: ["1->2->5", "1->3"]
#
# Explanation: All root-to-leaf paths are: 1->2->5, 1->3
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
# @return {String[]}
require_relative 'core/binary_tree'
require 'pry'
def binary_tree_paths(root)
  paths = []
  return paths if root.nil?

  find_paths root, '', paths
end

def find_paths(root, path, paths)
  path += root.val.to_s
  if root.left.nil? && root.right.nil? && !root.val.nil? # this third condition is there because of bug in binary tree implementation, in core/binary_tree. Will fix it 
    paths.push path
    return paths
  end
  paths = find_paths root.left, path.to_s + '->', paths unless root.left.nil?
  paths = find_paths root.right, path.to_s + '->', paths unless root.right.nil?
  paths
end

tree = BinaryTree.new [1, 2, 3, nil, 5]
p binary_tree_paths tree.root
