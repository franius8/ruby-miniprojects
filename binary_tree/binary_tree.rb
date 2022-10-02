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
            middle = ary.length/2 + ary.length % 2
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
    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
      end
end

class Node
    attr_accessor :value, :left, :right
    def initialize(value, left = nil, right = nil)
        @value = value
        @left = left
        @right = right
    end
end 

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree.pretty_print