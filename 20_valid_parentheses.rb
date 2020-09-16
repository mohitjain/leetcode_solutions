# Leetcode Problem: https://leetcode.com/problems/valid-parentheses/
# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
#
# An input string is valid if:
#
#     Open brackets must be closed by the same type of brackets.
#     Open brackets must be closed in the correct order.
#
#
#
# Example 1:
#
# Input: s = "()"
# Output: true
#
# Example 2:
#
# Input: s = "()[]{}"
# Output: true
#
# Example 3:
#
# Input: s = "(]"
# Output: false
#
# Example 4:
#
# Input: s = "([)]"
# Output: false
#
# Example 5:
#
# Input: s = "{[]}"
# Output: true
#
#
#
# Constraints:
#
#     1 <= s.length <= 104
#     s consists of parentheses only '()[]{}'.
# ----------------------------------------------------------------------------------------------------------------------
# 
# @param {String} s
# @return {Boolean}
require_relative 'core/stack'
OPENING = %w|{ [ (|.freeze
CLOSING = %w|} ] )|.freeze
OPENING_CLOSING_PAIR = {
  '(' => ')',
  '{' => '}',
  '[' => ']'
}.freeze

def is_valid(s)
  return true if s.nil? or s == ''
  return false if s.length == 1

  stack = Stack.new
  s.split('').each do |char|
    if OPENING.include? char
      stack.push char
    elsif CLOSING.include? char
      top = stack.pop
      return false if OPENING_CLOSING_PAIR[top] != char
    end
  end
  stack.empty?
end

p is_valid('()')
p is_valid('}()')
p is_valid('[')
p is_valid('((')

