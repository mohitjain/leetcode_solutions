# Leetcode Problem: https://leetcode.com/problems/missing-number/
# Given an array nums containing n distinct numbers taken from 0, 1, 2, ..., n, return the one that is missing from the array.
#
# Follow up: Could you implement a solution using only constant extra space complexity and linear runtime complexity?
#
#
#
# Example 1:
#
# Input: nums = [3,0,1]
# Output: 2
# Example 2:
#
# Input: nums = [0,1]
# Output: 2
# Example 3:
#
# Input: nums = [9,6,4,2,3,5,7,0,1]
# Output: 8
# Example 4:
#
# Input: nums = [0]
# Output: 1
#
#
# Constraints:
#
# n == nums.length
# 1 <= n <= 104
# 0 <= nums[i] <= n
# All the numbers of nums are unique.
# ----------------------------------------------------------------------------------------------------------------------

# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  data = {}
  nums.each do |num|
    data.merge! num => true
  end

  total_nums = nums.length + 1

  (0..total_nums).to_a.each do |num|
    return num if data[num].nil?
  end

end

p missing_number [3, 0, 1]
p missing_number [0, 1]
p missing_number [9, 6, 4, 2, 3, 5, 7, 0, 1]
