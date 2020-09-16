# Leetcode Problem: https://leetcode.com/problems/integer-to-english-words/
# Convert a non-negative integer to its english words representation. Given input is guaranteed to be less than 231 - 1.
#
#     Example 1:
#
#     Input: 123
# Output: "One Hundred Twenty Three"
#
# Example 2:
#
#     Input: 12345
# Output: "Twelve Thousand Three Hundred Forty Five"
#
# Example 3:
#
#     Input: 1234567
# Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
#
# Example 4:
#
#     Input: 1234567891
# Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"
#
# ----------------------------------------------------------------------------------------------------------------------
require_relative 'core/stack'
# @param {Integer} num
# @return {String}
def number_to_words(num)
  ones = ['', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine']
  teens = %w[Ten Eleven Twelve Thirteen Fourteen Fifteen Sixteen Seventeen Eighteen Nineteen]
  tens = ['', '', 'Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety']
  thousands = ['', 'Thousand', 'Million', 'Billion']

  return 'Zero' if num.zero?

  stack = Stack.new
  group = 0
  while num > 0
    digit3 = num % 10
    num /= 10
    digit2 = num % 10
    num /= 10
    digit1 = num % 10
    num /= 10

    if digit3 * 100 + digit2 * 10 + digit1 > 0
      stack.push thousands[group]
    end

    if digit2 == 1
      stack.push(teens[digit3])
    else
      stack.push(ones[digit3])
      stack.push(tens[digit2])
    end

    if digit1 > 0
      stack.push 'Hundred'
      stack.push ones[digit1]
    end

    group += 1
  end
  output = ''
  until stack.empty?
    element = stack.pop
    output = output + ' ' + element unless element.empty?
  end
  output.strip
end

p number_to_words(101)