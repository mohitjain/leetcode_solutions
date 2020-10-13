# Leetcode Problem: https://leetcode.com/problems/fizz-buzz/
# Write a program that outputs the string representation of numbers from 1 to n.
#
# But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.
#
# Example:
#
# n = 15,
#
# Return:
# [
#     "1",
#     "2",
#     "Fizz",
#     "4",
#     "Buzz",
#     "Fizz",
#     "7",
#     "8",
#     "Fizz",
#     "Buzz",
#     "11",
#     "Fizz",
#     "13",
#     "14",
#     "FizzBuzz"
# ]
# ----------------------------------------------------------------------------------------------------------------------
# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  mappings = {
      '3' => 'Fizz',
      '5' => 'Buzz'
  }

  output = []

  n.times.each do |index|
    num = index + 1
    data = ""

    mappings.keys.each do |mapping|
      if (num % mapping.to_i).zero?
        data += mappings[mapping]
      end
    end

    data = data == "" ? num.to_s : data
    output.push data
  end
  output
end