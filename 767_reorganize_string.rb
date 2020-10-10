# Leetcode problem: https://leetcode.com/problems/reorganize-string/
# Given a string S, check if the letters can be rearranged so that two characters that are adjacent to each other are not the same.
#
# If possible, output any possible result.  If not possible, return the empty string.
#
# Example 1:
#
# Input: S = "aab"
# Output: "aba"
# Example 2:
#
# Input: S = "aaab"
# Output: ""
# Note:
#
# S will consist of lowercase letters and have length in range [1, 500].
#-----------------------------------------------------------------------------------------------------------------------
# @param {String} s
# @return {String}
require_relative 'core/heap'
Character = Struct.new(:character, :counter)
def reorganize_string(s)
  data_count = {}
  s.split('').each do |char|
    data_count[char] = data_count[char].to_i + 1
  end

  max_heap = Heap.new :> do |a, b|
    a.counter == b.counter ? (a.character < b.character) : (a.counter > b.counter)
  end

  data_count.keys.each do |key|
    character = Character.new(key, data_count[key])
    max_heap.add character
  end

  result = ''

  while max_heap.size > 1
    top = max_heap.pop
    top_next = max_heap.pop

    result += top.character
    result += top_next.character

    if top.counter > 1
      top.counter -= 1
      max_heap.add top
    end

    if top_next.counter > 1
      top_next.counter -= 1
      max_heap.add top_next
    end
  end

  if max_heap.size == 1
    top = max_heap.pop
    return '' if top.counter > 1

    return '' if top.character == result[-1]

    result += top.character
  end
  result

end

p reorganize_string  'aab'
p reorganize_string 'aaab'
