# Leetcode Problem: https://leetcode.com/problems/meeting-rooms-ii/
# Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), find the minimum number of conference rooms required.
#
#     Example 1:
#
#     Input: [[0, 30],[5, 10],[15, 20]]
# Output: 2
#
# Example 2:
#
#     Input: [[7,10],[2,4]]
# Output: 1
#
# NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
#-----------------------------------------------------------------------------------------------------------------------

# @param {Integer[][]} intervals
# @return {Integer}
def min_meeting_rooms(intervals)
  start_times = intervals.collect(&:first).sort
  end_times = intervals.collect(&:last).sort
  start_point = 0
  end_point = 0
  used_rooms = 0

  while start_point < intervals.length
    if start_times[start_point] >= end_times[end_point]
      used_rooms -= 1
      end_point += 1
    end

    used_rooms += 1
    start_point += 1

  end

  used_rooms

end

p min_meeting_rooms([[0, 30], [5, 10], [15, 20]])
p min_meeting_rooms([[7, 10], [2, 4]])
