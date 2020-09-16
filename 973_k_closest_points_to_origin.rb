# Leetcode Solutions: https://leetcode.com/problems/k-closest-points-to-origin/
# We have a list of points on the plane.  Find the K closest points to the origin (0, 0).
#
# (Here, the distance between two points on a plane is the Euclidean distance.)
#
# You may return the answer in any order.  The answer is guaranteed to be unique (except for the order that it is in.)
#
#
#
# Example 1:
#
# Input: points = [[1,3],[-2,2]], K = 1
# Output: [[-2,2]]
# Explanation:
# The distance between (1, 3) and the origin is sqrt(10).
# The distance between (-2, 2) and the origin is sqrt(8).
# Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
# We only want the closest K = 1 points from the origin, so the answer is just [[-2,2]].
# Example 2:
#
# Input: points = [[3,3],[5,-1],[-2,4]], K = 2
# Output: [[3,3],[-2,4]]
# (The answer [[-2,4],[3,3]] would also be accepted.)
#
#
# Note:
#
# 1 <= K <= points.length <= 10000
# -10000 < points[i][0] < 10000
# -10000 < points[i][1] < 10000
#-----------------------------------------------------------------------------------------------------------------------
# @param {Integer[][]} points
# @param {Integer} k
# @return {Integer[][]}
require_relative 'core/heap'
def k_closest(points, k)
  data = {}
  heap = Heap.new

  points.each do |point|
    distance = point.first * point.first + point.last * point.last
    data[distance] = (data[distance] || []).push(point)
    heap.add distance
  end

  output = []
  k.times do
    distance = heap.pop
    output += data[distance] unless data[distance].nil?
    data.delete(distance)
  end
  output
end

p k_closest([[1, 3], [-2, 2]],  1)
# p k_closest([[3,3],[5,-1],[-2,4]], 2)
# p k_closest([[0,1],[1,0]], 2)
# p k_closest([[6,10],[-3,3],[-2,5],[0,2]], 3)
p k_closest([[-66, 42], [-67, 94], [46, 10], [35, 27], [-9, -6], [-84, -97], [38, -22], [3, -39], [71, -97], [-40, -86], [-45, 56], [-91, 59], [24, -11], [91, 100], [-68, 43], [34, 27]], 6)
