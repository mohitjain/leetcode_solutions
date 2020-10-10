# LeetCode Problem: https://leetcode.com/problems/kth-smallest-element-in-a-bst/
# Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.
#
#
#
# Example 1:
#
# Input: root = [3,1,4,null,2], k = 1
#    3
#   / \
#  1   4
#   \
#    2
# Output: 1
#
# Example 2:
#
# Input: root = [5,3,6,2,4,null,null,1], k = 3
#        5
#       / \
#      3   6
#     / \
#    2   4
#   /
#  1
# Output: 3
#
# Follow up:
# What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?
#
#
#
# Constraints:
#
#     The number of elements of the BST is between 1 to 10^4.
#     You may assume k is always valid, 1 ≤ k ≤ BST's total elements.
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
# @param {Integer} k
# @return {Integer}
require_relative 'core/binary_tree'
def kth_smallest(root, k)
  nums = []
  nums = inorder(root, nums, k)
  nums[k - 1]
end

def inorder(root, nums, k)
  return nums if root.nil?

  nums = inorder root.left, nums, k
  nums[nums.length] = root.val unless root.val.nil?
  return nums if nums.length == k
  inorder root.right, nums, k
end

tree = BinaryTree.new [5,3,6,2,4,nil,nil,1]
p kth_smallest(tree.root, 3)