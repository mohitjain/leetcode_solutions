# Leetcode Problem: https://leetcode.com/problems/partition-labels/
#A string S of lowercase English letters is given. We want to partition this string into as many parts as possible so that each letter appears in at most one part, and return a list of integers representing the size of these parts.
#
#
#
# Example 1:
#
# Input: S = "ababcbacadefegdehijhklij"
# Output: [9,7,8]
# Explanation:
# The partition is "ababcbaca", "defegde", "hijhklij".
# This is a partition so that each letter appears in at most one part.
# A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits S into less parts.
#
#
#
# Note:
#
#     S will have length in range [1, 500].
#     S will consist of lowercase English letters ('a' to 'z') only.
# ----------------------------------------------------------------------------------------------------------------------
# @param {String} s
# @return {Integer[]}
def partition_labels(s)
  parition_lengths = []
  last_indexes = {}
  s.split("").each_with_index do |char, index|
    last_indexes[char] = index
  end

  index = 0

  while index < s.length
    char = s[index]
    end_index = last_indexes[char]

    j = index
    while j < end_index
      end_index = [end_index, last_indexes[s[j]]].max
      j += 1
    end

    parition_lengths.push j - index + 1
    index = j + 1

  end
  parition_lengths
end

p partition_labels("ababcbacadefegdehijhklij")