# Leetcode Problem: https://leetcode.com/problems/binary-tree-right-side-view/
#Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
#
# Example:
#
# Input: [1,2,3,null,5,null,4]
# Output: [1, 3, 4]
# Explanation:
#
#    1            <---
#  /   \
# 2     3         <---
#  \     \
#   5     4       <---
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
# @return {Integer[][]}
require_relative 'core/binary_tree'
require_relative 'core/queue'
def right_side_view(root)
  right_side_elements = []
  return right_side_elements if root.nil?

  queue = Queue.new
  queue.enqueue root
  until queue.empty?
    size = queue.size

    size.times.each do |index|
      element = queue.dequeue
      queue.enqueue element.left if !element.left.nil? && !element.left.val.nil?
      queue.enqueue element.right if !element.right.nil? && !element.right.val.nil?
      right_side_elements.push element.val if index == size - 1
    end
  end

  right_side_elements
end

tree = BinaryTree.new [1,2,3,nil,5,nil,4]
p right_side_view tree.root