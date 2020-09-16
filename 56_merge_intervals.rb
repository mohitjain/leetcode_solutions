#Leetcode problem: https://leetcode.com/problems/merge-intervals/
# Given a collection of intervals, merge all overlapping intervals.
#
# Example 1:
#
# Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
# Output: [[1,6],[8,10],[15,18]]
# Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
# Example 2:
#
# Input: intervals = [[1,4],[4,5]]
# Output: [[1,5]]
# Explanation: Intervals [1,4] and [4,5] are considered overlapping.
# NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
#
# Constraints:
#
# intervals[i][0] <= intervals[i][1]
#------------------------------------------------------------------------------------------------------
# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
  return [] if intervals.size == 0
  intervals = intervals.sort_by{ |x,y| x }
  output = [intervals[0]]
  j = 0
  for i in 1..intervals.size - 1
    if output[j][1] >= intervals[i][0]
      end_time = [intervals[i][1], output[j][1]].max
      output[j] = [output[j][0], end_time]
    else
      output << intervals[i]
      j = j + 1
    end
  end
  output
end

p merge([[1,3],[2,6],[2, 7], [8,10],[15,18]])