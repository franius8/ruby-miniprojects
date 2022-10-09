# frozen_string_literal: true

require 'pry-byebug'

# Methods handling tree building and traversal
class Tree
  def initialize(ary)
    @ary = ary.uniq.sort
    @root = build_tree(@ary)
  end

  def build_tree(ary)
    return nil if ary.empty?

    middle = (ary.size - 1) / 2
    root = Node.new(ary[middle])

    root.left = build_tree(ary[0...middle])
    root.right = build_tree(ary[(middle + 1)..])

    return root
  end

  def insert(value, root = @root)
    return if value == root.value

    if root.value < value
      if root.right.nil?
        root.right = Node.new(value)
      else
        insert(value, root.right)
      end
    elsif root.value > value
      if root.left.nil?
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
      root
    elsif root.value < value
      return nil if root.right.nil?

      find(value, root.right)
    elsif root.value > value
      return nil if root.left.nil?

      find(value, root.left)
    end
  end

  def height(node)
    return 0 if node.nil?
    return 1 if node.left.nil? && node.right.nil?

    left_height = height(node.left)
    right_height = height(node.right)
    if left_height > right_height
      left_height + 1
    else
      right_height + 1
    end
  end

  def depth(node, root = @root)
    if node.value == root.value
      1
    elsif root.value < node.value
      depth(node, root.right) + 1
    else
      depth(node, root.left) + 1
    end
  end

  def level_order
    queue = [@root]
    result = []
    until queue.empty?
      node = queue.shift
      if block_given?
        yield(node)
      else
        result << node.value
      end
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
    result unless block_given?
  end

  def balanced?(root = @root)
    return true if root.nil?

    return true if (height(root.left) - height(root.right)).abs <= 1 && (balanced?(root.left) && balanced?(root.right))

    false
  end

  def rebalance
    return if balanced?

    ary = level_order.uniq.sort
    puts ary
    @root = build_tree(ary)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

# Class for a single node of the binary tree
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
tree.delete(3)
tree.pretty_print
print Tree.root
node = tree.find(42)
puts tree.depth(node)
