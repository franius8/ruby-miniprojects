require 'pry-byebug'

class Tree
    def initialize(ary)
        @ary = ary.uniq.sort
        @tree_data = []
        @root = build_tree(@ary)
    end

    def build_tree(ary)
        if ary.is_a?(Integer) || ary.length == 1
            return Node.new(ary[0])
        else
            middle = ary.length/2
            root = Node.new(ary[middle])
            root.left = build_tree(ary[0..middle-1])
            if ary.length == 2 || ary.length == 3
                root.right = build_tree(ary[1..ary.length-1])
            else
                root.right = build_tree(ary[middle+1..ary.length])
            end
            if root.left.value == root.value then root.left = nil end
            if root.right.value == root.value then root.right = nil end
            return root
        end
    end

    def insert(value, root = @root)
        return if value == root.value
       if root.value < value
            if root.right == nil 
                root.right = Node.new(value)
            else  
                insert(value, root.right)
            end
       elsif root.value > value
            if root.left == nil
                root.left = Node.new(value)
            else
                insert(value, root.left)   
            end
       end
    end

    def delete(value, root = @root)
        if root.left.value == value && root.left.left == nil && root.left.right == nil
            root.left = nil
            return root
        elsif root.right.value == value && root.right.left == nil && root.right.right == nil
            root.right = nil
            return root
        end
        if root.value < value
            root.right = delete(value, root.right)
        elsif root.value > value
            root.left = delete(value, root.left)
        else
            root.value = lowest_node(root.right).value
            root.delete(root.value, root.right)
        end
        root
    end

    def lowest_node(node)
        current_lowest = node
        until current_lowest.left.nil?
            current_lowest = current_lowest.left
        end
        current_lowest
    end

    def find(value, root = @root)
      if root.value == value
        return root
      elsif root.value < value
        return nil if root.right == nil
        find(value,root.right)
      elsif root.value > value
        return nil if root.left == nil
        find(value,root.left)
      end
    end

    def height(node)
        if node.nil?
            return 0
        end
        if node.left.nil? && node.right.nil?
            return 1
        end
        left_height = height(node.left)
        right_height = height(node.right)
        if left_height > right_height
            return left_height + 1
        else
            return right_height + 1
        end
    end

    def depth(node, root = @root)
        if node.value == root.value
            return 1
        elsif root.value < node.value
            depth(node, root.right) + 1
        else
            depth(node, root.left) + 1
        end
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
      end
end

class Node < Tree
    attr_accessor :value, :left, :right
    def initialize(value, left = nil, right = nil)
        @value = value
        @left = left
        @right = right
    end
end 

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree.insert(42)
tree.delete(8)
tree.pretty_print
