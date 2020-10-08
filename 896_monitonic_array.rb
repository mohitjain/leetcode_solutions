# Leetcode Problem: https://leetcode.com/problems/monotonic-array/
#An array is monotonic if it is either monotone increasing or monotone decreasing.
#
# An array A is monotone increasing if for all i <= j, A[i] <= A[j].  An array A is monotone decreasing if for all i <= j, A[i] >= A[j].
#
# Return true if and only if the given array A is monotonic.
#
#
#
# Example 1:
#
# Input: [1,2,2,3]
# Output: true
# Example 2:
#
# Input: [6,5,4,4]
# Output: true
# Example 3:
#
# Input: [1,3,2]
# Output: false
# Example 4:
#
# Input: [1,2,4,5]
# Output: true
# Example 5:
#
# Input: [1,1,1]
# Output: true
#
#
# Note:
#
# 1 <= A.length <= 50000
# -100000 <= A[i] <= 100000
# ----------------------------------------------------------------------------------------------------------------------
# @param {Integer[]} a
# @return {Boolean}
def is_monotonic(a)

  return true if [0, 1].include? a.length

  increasing = nil

  a.length.times do |index|
    next if index.zero?

    increasing = a[index - 1] < a[index] if increasing.nil? && a[index - 1] != a[index]

    next if increasing.nil? && a[index - 1] == a[index]

    if increasing
      return false if a[index] < a[index - 1]
    else
      return false if a[index] > a[index - 1]
    end
  end

  true
end

p is_monotonic [1, 2, 2, 3]
p is_monotonic [6, 5, 4, 4]
p is_monotonic [1, 3, 2]
p is_monotonic [1, 2, 4, 5]
