#Leetcode problem: https://leetcode.com/problems/rotting-oranges/
# In a given grid, each cell can have one of three values:
#
#     the value 0 representing an empty cell;
#     the value 1 representing a fresh orange;
#     the value 2 representing a rotten orange.
#
# Every minute, any fresh orange that is adjacent (4-directionally) to a rotten orange becomes rotten.
#
# Return the minimum number of minutes that must elapse until no cell has a fresh orange.  If this is impossible, return -1 instead.
#
# Example 1:
#
# Input: [[2,1,1],[1,1,0],[0,1,1]]
# Output: 4
#
# Example 2:
#
# Input: [[2,1,1],[0,1,1],[1,0,1]]
# Output: -1
# Explanation:  The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.
#
# Example 3:
#
# Input: [[0,2]]
# Output: 0
# Explanation:  Since there are already no fresh oranges at minute 0, the answer is just 0.
#
# Note:
#
#     1 <= grid.length <= 10
#     1 <= grid[0].length <= 10
#     grid[i][j] is only 0, 1, or 2.
#-----------------------------------------------------------------------------------------------------------------------
# @param {Integer[][]} grid
# @return {Integer}
require 'set'
def oranges_rotting(grid)
  fresh = Set.new
  rotten = Set.new
  number_of_rows = grid.length
  return -1 if number_of_rows.zero?
  return -1 if grid[0].nil?

  number_of_columns = grid[0].length

  number_of_rows.times.each do |row|
    number_of_columns.times.each do |column|
      fresh.add "#{row}-#{column}" if grid[row][column] == 1
      rotten.add "#{row}-#{column}" if grid[row][column] == 2
    end
  end
  minutes = 0
  until fresh.empty?
    newly_rotten_oranges = Set.new
    rotten.each do |rotten_orange|
      i = rotten_orange.split('-').first.to_i
      j = rotten_orange.split('-').last.to_i
      adjacent_elements = [
        "#{i - 1}-#{j}",
        "#{i + 1}-#{j}",
        "#{i}-#{j - 1}",
        "#{i}-#{j + 1}"
      ]

      adjacent_elements.each do |adjacent_element|
        next unless fresh.include? adjacent_element

        fresh.delete adjacent_element
        newly_rotten_oranges.add adjacent_element
      end
    end
    return -1 if newly_rotten_oranges.empty? && !fresh.empty?

    rotten.merge newly_rotten_oranges
    newly_rotten_oranges = Set.new
    minutes += 1
  end
  minutes
end

p oranges_rotting [[2, 1, 1], [1, 1, 0], [0, 1, 1]]
p oranges_rotting [[2, 1, 1], [0, 1, 1], [1, 0, 1]]
