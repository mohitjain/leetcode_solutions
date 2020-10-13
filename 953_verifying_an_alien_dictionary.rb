# Leetcode Problem: https://leetcode.com/problems/verifying-an-alien-dictionary/
# In an alien language, surprisingly they also use english lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.
#
# Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographicaly in this alien language.
#
#
#
# Example 1:
#
# Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
# Output: true
# Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.
# Example 2:
#
# Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
# Output: false
# Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.
# Example 3:
#
# Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
# Output: false
# Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).
#
#
# Constraints:
#
# 1 <= words.length <= 100
# 1 <= words[i].length <= 20
# order.length == 26
# All characters in words[i] and order are English lowercase letters.
# ----------------------------------------------------------------------------------------------------------------------
# @param {String[]} words
# @param {String} order
# @return {Boolean}
def is_alien_sorted(words, order)
  order_data = {}
  order.split('').each_with_index do |item, index|
    order_data[item] = index
  end
  (0..(words.length - 2)).to_a.each do |i|
    current_word = words[i]
    next_word = words[i + 1]
    current_word.split('').each_with_index do |current_word_char, index|
      next_word_char = next_word[index]
      return false if next_word_char.nil?
      break if order_data[current_word_char] < order_data[next_word_char]
      return false if order_data[current_word_char] > order_data[next_word_char]
    end
  end
  true
end

words = %w[hello leetcode]
order = 'hlabcdefgijkmnopqrstuvwxyz'
p is_alien_sorted(words, order)

words = %w[word world row]
order = 'worldabcefghijkmnpqstuvxyz'
p is_alien_sorted(words, order)