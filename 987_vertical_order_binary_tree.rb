# Leetcode Problem: https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree/
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
require 'pry'
def vertical_traversal(root)
  output = []
  node_data = {}
  vertical_data = {}
  queue = Queue.new
  queue.enqueue root
  node_data[root] = 0
  vertical_data[0] = (vertical_data[0] || []).push root.val

  while !queue.empty?
    node = queue.dequeue
    left_node = node.left
    right_node = node.right
    node_index = node_data[node]

    if !left_node.nil? && !left_node.val.nil?
      queue.enqueue(left_node)
      left_index = node_index - 1
      node_data[left_node] = left_index
      vertical_data[left_index] = (vertical_data[left_index] || []).push(left_node.val)
    end

    if !right_node.nil? && !right_node.val.nil?
      queue.enqueue(right_node)
      right_index = node_index + 1
      node_data[right_node] = right_index
      vertical_data[right_index] = (vertical_data[right_index] || []).push(right_node.val)
    end

  end


  levels = vertical_data.keys.sort
  levels.each do |level|
    output.push(vertical_data[level])
  end

  output

end

tree = BinaryTree.new([3,9,20,nil,nil,15,7])
p tree.to_s
p vertical_traversal(tree.root)