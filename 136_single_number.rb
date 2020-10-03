# Leetcode Problem: https://leetcode.com/problems/single-number/
#Given a non-empty array of integers, every element appears twice except for one. Find that single one.
#
# Note:
#
# Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
#
# Example 1:
#
# Input: [2,2,1]
# Output: 1
# Example 2:
#
# Input: [4,1,2,1,2]
# Output: 4
# ---------------------------------------------------------------------------------------------------------------------

# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  data = {}

  nums.each do |num|
    data[num] = data.fetch(num, 0) + 1
  end

  nums.each do |num|
    return num if data[num] == 1
  end
end

p single_number [2, 2, 1]
p single_number [4, 1, 2, 1, 2]
