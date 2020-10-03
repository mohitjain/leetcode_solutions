# Leetcode Problem: https://leetcode.com/problems/first-unique-character-in-a-string/
# Given a string, find the first non-repeating character in it and return its index. If it doesn't exist, return -1.
#
# Examples:
#
# s = "leetcode"
# return 0.
#
# s = "loveleetcode"
# return 2.
#
#
#
# Note: You may assume the string contains only lowercase English letters.
# ----------------------------------------------------------------------------------------------------------------------
# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  data = {}

  s.split('').each do |char|
    data[char] = data.fetch(char, 0) + 1
  end

  s.split('').each_with_index do |char, index|
    return index if data[char] == 1
  end
  -1
end

p first_uniq_char('leetcode')
p first_uniq_char('loveleetcode')
