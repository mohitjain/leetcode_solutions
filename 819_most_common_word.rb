# Leetcode Problem: https://leetcode.com/problems/most-common-word/
#Given a paragraph and a list of banned words, return the most frequent word that is not in the list of banned words.  It is guaranteed there is at least one word that isn't banned, and that the answer is unique.
#
# Words in the list of banned words are given in lowercase, and free of punctuation.  Words in the paragraph are not case sensitive.  The answer is in lowercase.
#
#
#
# Example:
#
# Input:
# paragraph = "Bob hit a ball, the hit BALL flew far after it was hit."
# banned = ["hit"]
# Output: "ball"
# Explanation:
# "hit" occurs 3 times, but it is a banned word.
# "ball" occurs twice (and no other word does), so it is the most frequent non-banned word in the paragraph.
# Note that words in the paragraph are not case sensitive,
# that punctuation is ignored (even if adjacent to words, such as "ball,"),
# and that "hit" isn't the answer even though it occurs more because it is banned.
#
#
#
# Note:
#
#     1 <= paragraph.length <= 1000.
#     0 <= banned.length <= 100.
#     1 <= banned[i].length <= 10.
#     The answer is unique, and written in lowercase (even if its occurrences in paragraph may have uppercase symbols, and even if it is a proper noun.)
#     paragraph only consists of letters, spaces, or the punctuation symbols !?',;.
#     There are no hyphens or hyphenated words.
#     Words only consist of letters, never apostrophes or other punctuation symbols.
# ----------------------------------------------------------------------------------------------------------------------
# @param {String} paragraph
# @param {String[]} banned
# @return {String}
require_relative 'core/heap'
Word = Struct.new(:word, :counter)
def most_common_word(paragraph, banned)
  banned_words = {}
  banned.each do |banned_word|
    banned_words.merge! banned_word.downcase => true
  end

  max_heap = Heap.new :> do |a, b|
    a.counter == b.counter ? (a.word < b.word) : (a.counter > b.counter)
  end

  words = {}
  paragraph = paragraph.tr('!?\',;.', ' ').strip
  paragraph.split(' ').each do |key|
    key = key.downcase.strip
    next if key.empty?
    next if banned_words.key? key

    words[key] = words[key].to_i + 1
  end

  words.keys.each do |key|
    word = Word.new(key, words[key])
    max_heap.add word
  end

  max_heap.pop.word
end

paragraph = 'Bob hit a ball, the hit BALL flew far after it was hit.'
banned = ['hit']

p most_common_word(paragraph, banned)

paragraph =  'a, a, a, a, b,b,b,c, c'
banned = ['a']

p most_common_word(paragraph, banned)
