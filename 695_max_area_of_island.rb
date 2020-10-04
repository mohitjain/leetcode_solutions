# Leetcode Problem: https://leetcode.com/problems/max-area-of-island/
#Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.
#
# Find the maximum area of an island in the given 2D array. (If there is no island, the maximum area is 0.)
#
# Example 1:
#
# [[0,0,1,0,0,0,0,1,0,0,0,0,0],
#  [0,0,0,0,0,0,0,1,1,1,0,0,0],
#  [0,1,1,0,1,0,0,0,0,0,0,0,0],
#  [0,1,0,0,1,1,0,0,1,0,1,0,0],
#  [0,1,0,0,1,1,0,0,1,1,1,0,0],
#  [0,0,0,0,0,0,0,0,0,0,1,0,0],
#  [0,0,0,0,0,0,0,1,1,1,0,0,0],
#  [0,0,0,0,0,0,0,1,1,0,0,0,0]]
#
# Given the above grid, return 6. Note the answer is not 11, because the island must be connected 4-directionally.
#
# Example 2:
#
# [[0,0,0,0,0,0,0,0]]
#
# Given the above grid, return 0.
#
# Note: The length of each dimension in the given grid does not exceed 50.
# ----------------------------------------------------------------------------------------------------------------------
# @param {Integer[][]} grid
# @return {Integer}

def max_area_of_island(grid)
  max_area = 0
  return max_area if grid.nil?

  number_of_rows = grid.length
  return max_area if number_of_rows.zero?

  number_of_columns = grid[0].length
  return max_area if number_of_columns.zero?


  number_of_rows.times.each do |row_index|
    number_of_columns.times.each do |column_index|
      element = grid[row_index][column_index]
      next if element.zero?

      if element == 1
        grid, count = mark_adjacents_as_visited(grid, row_index, column_index)
        max_area = [max_area, count].max
      end
    end
  end
  max_area
end

def mark_adjacents_as_visited(grid, row_index, column_index)
  count = 0
  number_of_rows = grid.length
  number_of_columns = grid[0].length

  if row_index.negative? || row_index >= number_of_rows || column_index.negative? || column_index >= number_of_columns
    return [grid, count]
  end

  element = grid[row_index][column_index]
  return [grid, count] if element.zero?

  count += 1
  grid[row_index][column_index] = 0

  grid, _count = mark_adjacents_as_visited(grid, row_index - 1, column_index) #top
  count += _count
  grid, _count = mark_adjacents_as_visited(grid, row_index + 1, column_index) #bottom
  count += _count
  grid, _count = mark_adjacents_as_visited(grid, row_index, column_index - 1) #Left
  count += _count
  grid, _count = mark_adjacents_as_visited(grid, row_index, column_index + 1) #right
  count += _count
  [grid, count]
end

p max_area_of_island [[0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
                      [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
                      [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
                      [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0],
                      [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0],
                      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
                      [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
                      [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0]]
