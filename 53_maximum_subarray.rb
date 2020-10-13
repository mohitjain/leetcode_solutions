# Leetcode problem: https://leetcode.com/problems/maximum-subarray/
# Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
#
# Follow up: If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
#
#
#
# Example 1:
#
# Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
# Output: 6
# Explanation: [4,-1,2,1] has the largest sum = 6.
# Example 2:
#
# Input: nums = [1]
# Output: 1
# Example 3:
#
# Input: nums = [0]
# Output: 0
# Example 4:
#
# Input: nums = [-1]
# Output: -1
# Example 5:
#
# Input: nums = [-2147483647]
# Output: -2147483647
#
#
# Constraints:
#
# 1 <= nums.length <= 2 * 104
# -231 <= nums[i] <= 231 - 1
# ----------------------------------------------------------------------------------------------------------------------
# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  maximum_sum = nums[0]
  current_max_sum = nums[0]
  nums.each_with_index do |num, index|
    next if index.zero?

    current_max_sum = [num, (current_max_sum + num)].max
    maximum_sum = [current_max_sum, maximum_sum].max
  end
  maximum_sum
end

p max_sub_array([1, 2])
p max_sub_array(nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4])
