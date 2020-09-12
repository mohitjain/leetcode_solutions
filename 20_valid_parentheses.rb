# Leetcode Problem: https://leetcode.com/problems/valid-parentheses/
# @param {String} s
# @return {Boolean}
require "pry"
require_relative 'core/stack'
OPENING = %w|{ [ (|
CLOSING = %w|} ] )|
OPENING_CLOSING_PAIR = {
    "(" => ")",
    "{" => "}",
    "[" => "]"
}

def is_valid(s)
  return true if s.nil? or s == ""
  return false if s.length == 1
  stack = Stack.new
  s.split("").each do |char|
    if OPENING.include? char
      stack.push char
    elsif CLOSING.include? char
      top = stack.pop
      return false if OPENING_CLOSING_PAIR[top] != char
    end
  end
  stack.empty?
end

p is_valid("()")
p is_valid("}()")
p is_valid("[")
p is_valid("((")

