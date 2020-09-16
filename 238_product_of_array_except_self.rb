#Leetcode problem: https://leetcode.com/problems/product-of-array-except-self/
# Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
#
# Example:
#
# Input:  [1,2,3,4]
# Output: [24,12,8,6]
# Constraint: It's guaranteed that the product of the elements of any prefix or suffix of the array (including the whole array) fits in a 32 bit integer.
#
# Note: Please solve it without division and in O(n).
#
# Follow up:
# Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)
# ----------------------------------------------------------------------------------------------------------------------
# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  left_product = []

  nums.each_with_index do |_, index|
    left_product.push(1) and next if index.zero?

    left_product.push(nums[index - 1] * left_product[index - 1])
  end

  counter = nums.length - 1
  right_product = Array.new(nums.length)
  nums.reverse_each do
    if counter == (right_product.length - 1)
      right_product[counter] = 1
      counter -= 1
      next
    end
    right_product[counter] = right_product[counter + 1] * nums[counter + 1]
    counter -= 1
  end

  output = []

  left_product.each_with_index do |left, index|
    right = right_product[index]
    output.push(left * right)
  end

  output

end

p product_except_self([4,5,1,8,2])
