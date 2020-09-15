# Leetcode Solutions: https://leetcode.com/problems/k-closest-points-to-origin/
# @param {Integer[][]} points
# @param {Integer} k
# @return {Integer[][]}
require_relative 'core/heap'
require "pry"
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
    p distance = heap.pop
    output = output + data[distance] unless data[distance].nil?
    data.delete(distance)
  end
  output
end

p k_closest([[1,3],[-2,2]],  1)
#
# p k_closest([[3,3],[5,-1],[-2,4]], 2)

# p k_closest([[0,1],[1,0]], 2)

# p k_closest([[6,10],[-3,3],[-2,5],[0,2]], 3)
#

p k_closest([[-66,42],[-67,94],[46,10],[35,27],[-9,-6],[-84,-97],[38,-22],[3,-39],[71,-97],[-40,-86],[-45,56],[-91,59],[24,-11],[91,100],[-68,43],[34,27]], 6)
