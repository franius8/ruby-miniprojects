class LinkedList
    def initialize
        @linked_array = []
    end
    
    def append(value)
        len = @linked_array.length
        @linked_array << Node.new(value)
        unless len == 0
            @linked_array[len-1].next_node = len
        end
    end

    def prepend(value)

    end

    def print_list
        print @linked_array
    end
end

class Node
    attr_accessor :value ,:next_node
    
    def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
    end
end

list = LinkedList.new
list.append(5)
list.append(10)
list.print_list
