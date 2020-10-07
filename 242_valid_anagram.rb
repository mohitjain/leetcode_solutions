# Leetcode Problem: https://leetcode.com/problems/valid-anagram/
#Given two strings s and t , write a function to determine if t is an anagram of s.
#
# Example 1:
#
# Input: s = "anagram", t = "nagaram"
# Output: true
#
# Example 2:
#
# Input: s = "rat", t = "car"
# Output: false
#
# Note:
# You may assume the string contains only lowercase alphabets.
#
# Follow up:
# What if the inputs contain unicode characters? How would you adapt your solution to such case?
#-----------------------------------------------------------------------------------------------------------------------
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  return false if s.length != t.length
  
  data = {}
  s.split('').each do |char|
    data[char] = data.fetch(char, 0) + 1
  end

  t.split('').each do |char|
    return false if data[char].nil?

    data[char] = data[char] - 1
    data.delete(char) if data[char].zero?
  end

  data.keys.length.zero?
end
s = 'anagram'
t = 'nagaram'
p is_anagram s, t

s = 'rat'
t = 'car'
p is_anagram s, t