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
      value = self.data[key]
      update_position_of_key_in_list(key) unless value.nil?
      value || -1
    end


=begin
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end
    def put(key, value)
      self.used_capacity = used_capacity + 1 if self.data[key].nil?
      self.data = self.data.merge(key => value)
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
      key = list.tail.value
      data = self.data
      data.delete(key)
      self.data = data
      list.remove_last
    end

end
