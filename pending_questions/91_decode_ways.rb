# Leetcode Problem: https://leetcode.com/problems/decode-ways/
#A message containing letters from A-Z is being encoded to numbers using the following mapping:
#
# 'A' -> 1
# 'B' -> 2
# ...
# 'Z' -> 26
# Given a non-empty string containing only digits, determine the total number of ways to decode it.
#
# The answer is guaranteed to fit in a 32-bit integer.
#
#
#
# Example 1:
#
# Input: s = "12"
# Output: 2
# Explanation: It could be decoded as "AB" (1 2) or "L" (12).
# Example 2:
#
# Input: s = "226"
# Output: 3
# Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
# Example 3:
#
# Input: s = "0"
# Output: 0
# Explanation: There is no character that is mapped to a number starting with '0'. We cannot ignore a zero when we face it while decoding. So, each '0' should be part of "10" --> 'J' or "20" --> 'T'.
# Example 4:
#
# Input: s = "1"
# Output: 1
#
#
# Constraints:
#
# 1 <= s.length <= 100
# s contains only digits and may contain leading zero(s).
# ----------------------------------------------------------------------------------------------------------------------
# @param {String} s
# @return {Integer}
require 'pry'
def num_decodings(s)
  dp = []
  dp[0] = 1
  dp[1] = (s == '0' ? 0 : 1)

  (2..s.length).to_a.each do |index|
    current = s[index].to_i
    last_two_digits = s[index - 2...index].to_i
    dp[index] = dp[index - 1] if current >= 1

    dp[index] = dp[index].to_i + dp[index - 2] if last_two_digits >= 10 && last_two_digits <= 26
  end

  dp[s.length]
end

p num_decodings '12'
p num_decodings '226'