# Leetcode Problem: https://leetcode.com/problems/3sum/
#Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
#
# Notice that the solution set must not contain duplicate triplets.
#
#
#
# Example 1:
#
# Input: nums = [-1,0,1,2,-1,-4]
# Output: [[-1,-1,2],[-1,0,1]]
#
# Example 2:
#
# Input: nums = []
# Output: []
#
# Example 3:
#
# Input: nums = [0]
# Output: []
#
#
#
# Constraints:
#
#     0 <= nums.length <= 3000
#     -105 <= nums[i] <= 105
# ----------------------------------------------------------------------------------------------------------------------
# @param {Integer[]} nums
# @return {Integer[][]}
require 'pry'
def three_sum(nums)
  data = {}

  nums.each_with_index do |num, index|
    data[num] = data.fetch(data[num], []).push index
  end
  output = {}
  nums.each_with_index do |num, index|
    target = -num
    nums.each_with_index do |num2, index2|
      next if index == index2

      next if data[target - num2].nil?

      data[target - num2].each do |original_index|
        next if original_index == index || original_index == index2

        output.merge! [num, num2, target - num2].sort => true
      end
    end
  end
  output.keys
end

p three_sum [-1, 0, 1, 2, -1, -4]

