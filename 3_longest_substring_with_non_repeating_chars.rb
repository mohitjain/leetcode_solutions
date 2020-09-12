# Leetcode Problem: https://leetcode.com/problems/longest-substring-without-repeating-characters/
# @param {String} s
# @return {Integer}
require 'pry'

def length_of_longest_substring(string)
  data = {}
  max_length = 0
  current_length = 0
  start_index = 0
  string.split("").each_with_index do |char, index|
    if data[char].nil?
      current_length = current_length + 1
      data[char] = index
      max_length = current_length if current_length > max_length
    else
      curr_start_index = data[char] + 1
      (start_index..data[char]).each do |i|
        data[string[i]] = nil
      end
      start_index = curr_start_index
      data[char] = index
      current_length = index - start_index + 1
    end
  end
  max_length
end


p length_of_longest_substring("hello")
