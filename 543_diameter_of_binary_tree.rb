# Leetcode Problem: https://leetcode.com/problems/diameter-of-binary-tree/
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
require_relative 'core/binary_tree'
def diameter_of_binary_tree(root)
  return 0 if root.nil?
  diameter, height = diameter_of_binary_tree_util(root)
  [diameter, height].max - 1
end

def diameter_of_binary_tree_util(root)
  return [0,0] if root.nil?
  l_diameter, l_h = diameter_of_binary_tree_util(root.left)
  r_diameter, r_h = diameter_of_binary_tree_util(root.right)
  height = [l_h, r_h].max + 1

  diameter = [l_diameter, r_diameter, l_h+r_h+1].max
  [diameter, height]
end

tree = BinaryTree.new [1,2,3,4,5]
p diameter_of_binary_tree(tree.root)