# Leetcode Problem: https://leetcode.com/problems/longest-common-prefix/
#Write a function to find the longest common prefix string amongst an array of strings.
#
# If there is no common prefix, return an empty string "".
#
#
#
# Example 1:
#
# Input: strs = ["flower","flow","flight"]
# Output: "fl"
# Example 2:
#
# Input: strs = ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.
#
#
# Constraints:
#
# 0 <= strs.length <= 200
# 0 <= strs[i].length <= 200
# strs[i] consists of only lower-case English letters.
# ----------------------------------------------------------------------------------------------------------------------
# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return '' if strs.empty?

  prefix = ''
  s = strs[0]
  s.length.times.each do |index|
    char = s[index]
    all_has = true
    strs.each do |str|
      all_has &&= str.start_with?(prefix + char)
    end
    return prefix unless all_has

    prefix += char
  end

  prefix
end

p longest_common_prefix %w[flower flow flight]
p longest_common_prefix %w[dog racecar car]
p longest_common_prefix %w[aaa aa aaa]
