# Leetcode Problem: https://leetcode.com/problems/move-zeroes/
#Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
#
# Example:
#
# Input: [0,1,0,3,12]
# Output: [1,3,12,0,0]
#
# Note:
#
#     You must do this in-place without making a copy of the array.
#     Minimize the total number of operations.
# ----------------------------------------------------------------------------------------------------------------------
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  count = nums.length

  index = 0

  count.times.each do |i|
    if nums[i] != 0
      nums[index] = nums[i]
      index += 1
    end
  end

  (index..count - 1).each do |i|
    nums[i] = 0
  end

  nums
end

p move_zeroes [0,1,0,3,12]
