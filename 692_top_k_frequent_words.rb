# Leetcode Question: https://leetcode.com/problems/top-k-frequent-words/
# @param {String[]} words
# @param {Integer} k
# @return {String[]}
require_relative "core/heap"
Word = Struct.new(:word, :counter)
def top_k_frequent(words, k)
  max_heap = Heap.new :> do |a, b|
                (a.counter == b.counter) ? (a.word < b.word) : (a.counter > b.counter)
            end
  data = {}

  words.each do |word|
    data[word] = (data[word] || 0) + 1
  end

  data.keys.each do |key|
    word = Word.new(key, data[key])
    max_heap.add word
  end

  output = []
  k.times.each do
    output.push max_heap.pop.word
  end

  output
end

p top_k_frequent(["i", "love", "leetcode", "i", "love", "coding"],2)