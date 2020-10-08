# Leetcode Problem: https://leetcode.com/problems/lru-cache/
#Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.
#
# get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
# put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
#
# The cache is initialized with a positive capacity.
#
# Follow up:
# Could you do both operations in O(1) time complexity?
#
#
#
# Example 1:
#
# Input
# ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
# [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
# Output
# [null, null, null, 1, null, -1, null, -1, 3, 4]
#
# Explanation
# LRUCache lRUCache = new LRUCache(2);
# lRUCache.put(1, 1);
# lRUCache.put(2, 2);
# lRUCache.get(1);    // return 1
# lRUCache.put(3, 3); // evicts key 2
# lRUCache.get(2);    // returns -1 (not found)
# lRUCache.put(4, 4); // evicts key 1
# lRUCache.get(1);    // return -1 (not found)
# lRUCache.get(3);    // return 3
# lRUCache.get(4);    // return 4
#
#
# Constraints:
#
# 1 <= capacity <= 3000
# 0 <= key <= 3000
# 0 <= value <= 104
# At most 3 * 104 calls will be made to get and put.
# ----------------------------------------------------------------------------------------------------------------------
require_relative 'core/doubly_linked_list'

class LRUCache
  attr_accessor :data, :capacity, :used_capacity
  #     :type capacity: Integer
  def initialize(capacity)
    self.capacity = capacity
    self.used_capacity = 0
  end

  #     :type key: Integer
  #     :rtype: Integer
  def get(key)
    val = data[key]
    update_position_of_key_in_list(key) unless val.nil?
    val || -1
  end

  #     :type key: Integer
  #     :type val: Integer
  #     :rtype: Void
  def put(key, val)
    self.used_capacity = used_capacity + 1 if data[key].nil?
    self.data = data.merge(key => val)
    update_position_of_key_in_list(key)
    delete_extra_keys
  end

  def data
    @data ||= {}
  end

  private

  def list
    @list ||= DoublyLinkedList.new
  end

  def update_position_of_key_in_list(key)
    list.remove(key)
    list.append_at_start(key)
  end

  def delete_extra_keys
    return if used_capacity <= capacity

    self.used_capacity = used_capacity - 1
    key = list.tail.val
    data = self.data
    data.delete(key)
    self.data = data
    list.remove_last
  end

end
