# Leetcode Problem: https://leetcode.com/problems/valid-palindrome/
#Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
#
# Note: For the purpose of this problem, we define empty string as valid palindrome.
#
# Example 1:
#
# Input: "A man, a plan, a canal: Panama"
# Output: true
# Example 2:
#
# Input: "race a car"
# Output: false
# ----------------------------------------------------------------------------------------------------------------------
# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  return true if s.length.zero?

  start_index = 0
  end_index = s.length - 1

  allowed = ('a'..'z').to_a + (0..9).to_a.collect(&:to_s)
  while start_index < end_index
    unless allowed.include? s[start_index].downcase
      start_index += 1
      next
    end

    unless allowed.include? s[end_index].downcase
      end_index -= 1
      next
    end

    return false if s[start_index].downcase != s[end_index].downcase

    start_index += 1
    end_index -= 1
  end
  true
end

p is_palindrome 'A man, a plan, a canal: Panama'
p is_palindrome 'race a car'
