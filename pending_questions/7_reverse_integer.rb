# Leetcode problem: https://leetcode.com/problems/reverse-integer/
# Given a 32-bit signed integer, reverse digits of an integer.
#
# Note:
# Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
#
#
#
# Example 1:
#
# Input: x = 123
# Output: 321
#
# Example 2:
#
# Input: x = -123
# Output: -321
#
# Example 3:
#
# Input: x = 120
# Output: 21
#
# Example 4:
#
# Input: x = 0
# Output: 0
#
#
#
# Constraints:
#
#     -231 <= x <= 231 - 1
------------------------------------------------------------------------------------------------------------------------
# @param {Integer} x
# @return {Integer}
def reverse(x)
  FIXNUM_MAX = ( 2 ** ( 0.size * 8 - 2 ) -1)
  FIXNUM_MIN = -( 2 ** ( 0.size * 8 - 2 ))
  num = 0

  negative = x.negative?
  x = -x if negative
  until x.zero?
    mod = x % 10
    x /= 10
    num = num * 10 + mod
  end
  negative ? -num : num
end
