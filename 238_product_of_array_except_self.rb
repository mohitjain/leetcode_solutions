#Leetcode problem: https://leetcode.com/problems/product-of-array-except-self/
# @param {Integer[]} nums
# @return {Integer[]}
require 'pry'
def product_except_self(nums)
  left_product = []

  nums.each_with_index do |num, index|
    left_product.push(1) and next if index == 0

    left_product.push(nums[index - 1] * left_product[index - 1])
  end

  counter = nums.length - 1
  right_product = Array.new(nums.length)
  nums.reverse_each do |num|
    if counter == (right_product.length - 1)
      right_product[counter] = 1
      counter = counter - 1
      next
    end
    right_product[counter] = right_product[counter + 1] * nums[counter + 1]
    counter = counter - 1
  end

  p left_product
  p right_product
  output = []

  left_product.each_with_index do |left, index|
      right = right_product[index]
      output.push(left * right)
  end

  output

end

p product_except_self([4,5,1,8,2])