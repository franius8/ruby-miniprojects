class LinkedList
    def initialize
        @linked_array = []
    end
    
    def append(value)
        len = @linked_array.length
        @linked_array.each {|node| node.next_node = len if node.next_node.nil?}
        @linked_array << Node.new(value)
    end

    def prepend(value)
        @linked_array.each {|node| node.next_node += 1 unless node.next_node.nil?}
        @linked_array << Node.new(value, 1)
    end

    def size
        @linked_array.length
    end

    def head
        @linked_array.find {|node| node.next_node == 1}
    end

    def tail
        @linked_array.find {|node| node.next_node.nil?}
    end

    def at_index(index)
        if index > @linked_array.length-1
            puts "No such index."
            return nil
        elsif index == @linked_array.length-1
            tail
        else
            @linked_array.find {|node| node.next_node == index+1}
        end
    end

    def pop
       @linked_array.delete(@linked_array.find {|node| node.next_node.nil?})
       @linked_array.find {|node| node.next_node == @linked_array.length}.next_node = nil
    end

    def contains?(value)
        return true if @linked_array.any? {|node| node.value == value}
        false
    end

    def find(value)
        node = @linked_array.find {|node| node.value == value}
        if node.next_node == nil
            return @linked_array.length
        else
            return node.next_node-1
        end
    end

    def to_s
        string =''
        index = 0
        while index < @linked_array.length
            string.concat(to_s_converter(index))
            index += 1
        end
        string
    end
    
    def to_s_converter(index)
        if index == @linked_array.length-1
            node = @linked_array.find {|node| node.next_node == nil}
            return "#{node.value} -> nil\n"
        else
            node = @linked_array.find {|node| node.next_node == index+1}
            return "#{node.value} -> "
        end
    end

    def insert_at(value,index)
        @linked_array.each do |node|
            next if node.next_node.nil?
            if node.next_node > index
              node.next_node += 1
            end
        end
        @linked_array << Node.new(value, index+1)
    end

    def remove_at(index)
        if index == @linked_array.length
            @linked_array.delete(@linked_array.find {|node| node.next_node == nil})
        else
            @linked_array.delete(@linked_array.find {|node| node.next_node == index+1})
            @linked_array.each do |node|
                next if node.next_node.nil?
                if node.next_node > index
                    node.next_node -= 1
                end
            end
        end
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
list.append(15)
list.insert_at(25,1)
list.prepend(20)
list.remove_at(3)
puts list.to_s
