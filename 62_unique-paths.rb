# Leetcode Problem: https://leetcode.com/problems/unique-paths/
# A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
#
# The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
#
# How many possible unique paths are there?
#
#
#
# Example 1:
#
# Input: m = 3, n = 7
# Output: 28
#
# Example 2:
#
# Input: m = 3, n = 2
# Output: 3
# Explanation:
# From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
# 1. Right -> Down -> Down
# 2. Down -> Down -> Right
# 3. Down -> Right -> Down
#
# Example 3:
#
# Input: m = 7, n = 3
# Output: 28
#
# Example 4:
#
# Input: m = 3, n = 3
# Output: 6
#
#
#
# Constraints:
#
#     1 <= m, n <= 100
#     It's guaranteed that the answer will be less than or equal to 2 * 109.
# ----------------------------------------------------------------------------------------------------------------------
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  data = Array.new(m) { Array.new(n)}

  m.times.each do |index|
    data[index][0] = 1
  end

  n.times.each do |index|
    data[0][index] = 1
  end

  m.times.each do |row|
    n.times.each do |column|
      next if row.zero? || column.zero?
      data[row][column] = data[row - 1][column] + data[row][column - 1]
    end
  end

  data[m - 1][n - 1]
end

p unique_paths(7, 3)
p unique_paths(3, 3)
