# Leetcode Problem: https://leetcode.com/problems/word-search/
#Given a 2D board and a word, find if the word exists in the grid.
#
# The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.
#
# Example:
#
# board =
# [
#   ['A','B','C','E'],
#   ['S','F','C','S'],
#   ['A','D','E','E']
# ]
#
# Given word = "ABCCED", return true.
# Given word = "SEE", return true.
# Given word = "ABCB", return false.
#
#
#
# Constraints:
#
#     board and word consists only of lowercase and uppercase English letters.
#     1 <= board.length <= 200
#     1 <= board[i].length <= 200
#     1 <= word.length <= 10^3
# ----------------------------------------------------------------------------------------------------------------------
# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
  number_of_rows = board.length
  number_of_columns = board[0].length
  found = false
  number_of_rows.times.each do |row|
    number_of_columns.times.each do |column|
      char = word[0]
      next unless char == board[row][column]

      found = find_word board, word[1..word.length - 1], row, column
      p "#{row} #{column} #{found}"
      return found if found
    end
  end
  found
end

def find_word(board, word, row, column)
  return false if row.negative? || column.negative? || row > board.length - 1 || column > board[0].length - 1
  return true if word == ''

  char = word[0]
  return false if char != board[row][column]

  word = word[1..word.length - 1]
  temp = board[row][column]
  board[row][column] = ' '
  found = (
        find_word(board, word, row - 1, column) ||
        find_word(board, word, row + 1, column) ||
        find_word(board, word, row, column - 1) ||
        find_word(board, word, row, column + 1)
  )
  board[row][column] = temp
  found
end

board = [
  %w[A B C E],
  %w[S F C S],
  %w[A D E E]
]
p exist board, 'ABCCED'
p exist board, 'SEE'
p exist board, 'ABCB'
