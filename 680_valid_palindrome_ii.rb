# Leetcode Problem: https://leetcode.com/problems/valid-palindrome-ii/
#  Given a non-empty string s, you may delete at most one character. Judge whether you can make it a palindrome.
#
# Example 1:
#
# Input: "aba"
# Output: True
#
# Example 2:
#
# Input: "abca"
# Output: True
# Explanation: You could delete the character 'c'.
#
# Note:
#
#     The string will only contain lowercase characters a-z. The maximum length of the string is 50000.
# ----------------------------------------------------------------------------------------------------------------------
# @param {String} s
# @return {Boolean}
def valid_palindrome(s)
  start_index = 0
  end_index = s.length - 1
  while start_index < end_index
    if s[start_index] != s[end_index]
      return (is_palindrome(s, start_index + 1, end_index) || is_palindrome(s, start_index, end_index - 1))
    end

    start_index += 1
    end_index -= 1
  end
  true
end

def is_palindrome(s, start_index, end_index)
  while start_index < end_index
    return false if s[start_index] != s[end_index]

    start_index += 1
    end_index -= 1
  end
  true
end

p valid_palindrome "aba"
p valid_palindrome "abca"
p valid_palindrome 'deee'
