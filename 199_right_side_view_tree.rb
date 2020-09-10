# Leetcode problem: https://leetcode.com/problems/binary-tree-right-side-view/solution/
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
# @return {Integer[]}

require_relative 'core/binary_tree'
require_relative 'core/queue'
def right_side_view(root)
  queue = Queue.new
  output = []
  queue.enqueue root
  queue.enqueue nil

  while !queue.empty?
    element = queue.dequeue
    next if element.nil?

    queue.enqueue(element.left) unless element.left.nil?
    queue.enqueue(element.right) unless element.right.nil?

    if queue.front.nil?
      output.push(element.val)
      queue.enqueue nil
    end
  end

  output
end

input = [1,2,3,nil,5,nil,4]
tree = BinaryTree.new(input)
p right_side_view(tree.root)