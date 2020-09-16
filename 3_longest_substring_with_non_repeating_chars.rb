# Leetcode Problem: https://leetcode.com/problems/longest-substring-without-repeating-characters/
# Given a string s, find the length of the longest substring without repeating characters.
#
# Example 1:
#
# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.
#
# Example 2:
#
# Input: s = "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.
#
# Example 3:
#
# Input: s = "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3.
# Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
#
# Example 4:
#
# Input: s = ""
# Output: 0
#
# Constraints:
#
#     0 <= s.length <= 5 * 104
#     s consists of English letters, digits, symbols and spaces.
# ----------------------------------------------------------------------------------------------------------------------
# @param {String} s
# @return {Integer}
def length_of_longest_substring(string)
  data = {}
  max_length = 0
  current_length = 0
  start_index = 0
  string.split('').each_with_index do |char, index|
    if data[char].nil?
      current_length += 1
      data[char] = index
      max_length = current_length if current_length > max_length
    else
      curr_start_index = data[char] + 1
      (start_index..data[char]).each do |i|
        data[string[i]] = nil
      end
      start_index = curr_start_index
      data[char] = index
      current_length = index - start_index + 1
    end
  end
  max_length
end


p length_of_longest_substring('hello')
