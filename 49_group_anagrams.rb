# Leetcode Problem: https://leetcode.com/problems/group-anagrams/
# Given an array of strings strs, group the anagrams together. You can return the answer in any order.
#
#     An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
#
#
#
#     Example 1:
#
#     Input: strs = ["eat","tea","tan","ate","nat","bat"]
# Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
#
# Example 2:
#
#     Input: strs = [""]
# Output: [[""]]
#
# Example 3:
#
#     Input: strs = ["a"]
# Output: [["a"]]
#
#
#
# Constraints:
#
#     1 <= strs.length <= 104
# 0 <= strs[i].length <= 100
# strs[i] consists of lower-case English letters.
# -------------------------------------------------------------------------------------------------------------------
# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  data = {}
  strs.each do |str|
    sorted = str.chars.sort.join
    data[sorted] = data.fetch(sorted, []).push str
  end

  data.values
end

p group_anagrams %w[eat tea tan ate nat bat]
p group_anagrams ['']
p group_anagrams ['a']
