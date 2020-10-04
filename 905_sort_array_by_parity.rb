# Leetcode Problem: https://leetcode.com/problems/sort-array-by-parity/
#Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.
#
# You may return any answer array that satisfies this condition.
#
#
#
# Example 1:
#
# Input: [3,1,2,4]
# Output: [2,4,3,1]
# The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
#
#
#
# Note:
#
#     1 <= A.length <= 5000
#     0 <= A[i] <= 5000
# ----------------------------------------------------------------------------------------------------------------------
# @param {Integer[]} a
# @return {Integer[]}
def sort_array_by_parity(a)
  start_index = 0
  end_index = a.length - 1

  while (start_index < end_index)

    if a[start_index].odd? && a[end_index].even?
      temp = a[start_index]
      a[start_index] = a[end_index]
      a[end_index] = temp
    end

    start_index += 1 if a[start_index].even?

    end_index -= 1 if a[end_index].odd?
  end
  a
end