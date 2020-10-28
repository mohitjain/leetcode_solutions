# Leetcode Problem: https://leetcode.com/problems/path-sum-ii/
#Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.
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
#  /  \    / \
# 7    2  5   1
#
# Return:
#
# [
#    [5,4,11,2],
#    [5,8,4,5]
# ]
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
# @param {Integer} sum
# @return {Integer[][]}
require_relative 'core/binary_tree'
def path_sum(root, sum)
  paths = []
  find_paths(root, sum, [], paths)
end

def find_paths(root, sum, current_path, paths)
  return paths if root.nil? || root.val.nil?

  current_path.push root.val
  if root.val == sum && root.left.nil? && root.right.nil?
    paths.push current_path
    return paths
  end
  paths = find_paths(root.right, sum - root.val, current_path.dup, paths)
  paths = find_paths(root.left, sum - root.val, current_path.dup, paths)
  paths
end

tree = BinaryTree.new [5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, 5, 1]
p path_sum tree.root, 22