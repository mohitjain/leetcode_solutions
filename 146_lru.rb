require_relative 'core/doubly_linked_list'

class LRUCache
    attr_accessor :data, :capacity, :used_capacity
=begin
    :type capacity: Integer
=end
    def initialize(capacity)
      self.capacity = capacity
      self.used_capacity = 0
    end

=begin
    :type key: Integer
    :rtype: Integer
=end
    def get(key)
      val = self.data[key]
      update_position_of_key_in_list(key) unless val.nil?
      val || -1
    end


=begin
    :type key: Integer
    :type val: Integer
    :rtype: Void
=end
    def put(key, val)
      self.used_capacity = used_capacity + 1 if self.data[key].nil?
      self.data = self.data.merge(key => val)
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
