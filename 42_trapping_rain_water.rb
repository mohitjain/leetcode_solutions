
# Leetcode Problem: https://leetcode.com/problems/trapping-rain-water/
# Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
#
#
# The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!
#
# Example:
#
# Input: [0,1,0,2,1,0,1,3,2,1,2,1]
# Output: 6
# ----------------------------------------------------------------------------------------------------------------------
# @param {Integer[]} height
# @return {Integer}
def trap(heights)
  left_max_heights = []
  right_max_heights = []

  left_max = nil
  heights.each_with_index do |height, index|
    if left_max.nil?
      left_max = height
      left_max_heights[0] = height
    else
      left_max = [left_max, height].max
    end
    left_max_heights[index + 1] = left_max if index < heights.length - 1
  end

  right_max = nil
  index = heights.length - 1
  heights.reverse_each do |height|
    if right_max.nil?
      right_max = height
      right_max_heights[index] = height
    else
      right_max = [right_max, height].max
    end
    right_max_heights[index - 1] = right_max if index.positive?
    index -= 1
  end

  output = 0
  p left_max_heights
  p right_max_heights
  heights.each_with_index do |_height, index|
    current_trapped_water = [left_max_heights[index], right_max_heights[index]].min - heights[index]
    output += current_trapped_water  if current_trapped_water.positive?
  end
  output
end

p trap(
    [0,1,0,2,1,0,1,3,2,1,2,1]
)