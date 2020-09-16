#Leetcode Problem: https://leetcode.com/problems/meeting-rooms/
# Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), determine if a person could attend all meetings.
#
#     Example 1:
#
#     Input: [[0,30],[5,10],[15,20]]
# Output: false
#
# Example 2:
#
#     Input: [[7,10],[2,4]]
# Output: true
#
# NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
#-----------------------------------------------------------------------------------------------------------------------
# @param {Integer[][]} intervals
# @return {Boolean}
def can_attend_meetings(intervals)
  intervals = intervals.sort {|x, y| x.first <=> y.first }

  intervals.each_with_index do |_, index|
    return true if index == intervals.length - 1
    return false if intervals[index][1] > intervals[index + 1][0]
  end
  true
end

p can_attend_meetings([[0, 30], [5, 10], [15, 20]])
p can_attend_meetings [[7, 10], [2, 4]]
