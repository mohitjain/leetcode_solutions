# Leetcode Problem: https://leetcode.com/problems/climbing-stairs/
# You are climbing a stair case. It takes n steps to reach to the top.
#
# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
#
# Example 1:
#
# Input: 2
# Output: 2
# Explanation: There are two ways to climb to the top.
# 1. 1 step + 1 step
# 2. 2 steps
#
# Example 2:
#
# Input: 3
# Output: 3
# Explanation: There are three ways to climb to the top.
# 1. 1 step + 1 step + 1 step
# 2. 1 step + 2 steps
# 3. 2 steps + 1 step
#
#
#
# Constraints:
#
#     1 <= n <= 45
# ----------------------------------------------------------------------------------------------------------------------
# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  data = []
  data[0] = 1
  data[1] = 1
  (2..n).to_a.each do |index|
    data[index] = data[index - 1] + data[index - 2]
  end
  data[n]
end

p climb_stairs 2
p climb_stairs 3
