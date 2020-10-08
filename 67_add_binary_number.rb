# Leetcode Problem: https://leetcode.com/problems/add-binary/
#Given two binary strings, return their sum (also a binary string).
#
# The input strings are both non-empty and contains only characters 1 or 0.
#
# Example 1:
#
# Input: a = "11", b = "1"
# Output: "100"
# Example 2:
#
# Input: a = "1010", b = "1011"
# Output: "10101"
#
#
# Constraints:
#
# Each string consists only of '0' or '1' characters.
# 1 <= a.length, b.length <= 10^4
# Each string is either "0" or doesn't contain any leading zero.
# ----------------------------------------------------------------------------------------------------------------------
# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  output = ''
  carry = 0
  i = a.length - 1
  j = b.length - 1
  while i >= 0 || j >= 0
    sum = 0
    l_a = a[i - a.length] # "0" "1" nil
    l_b = b[j - b.length] # "0" "1" nil

    sum = sum + l_a.to_i + l_b.to_i + carry

    output = (sum % 2).to_s + output
    carry = sum / 2
    i -= 1
    j -= 1
  end
  output = carry.to_s + output  unless carry.zero?
  output
end

a = '11'
b = '1'
p add_binary(a, b)

a = '1010'
b = '1011'

p add_binary(a, b)
