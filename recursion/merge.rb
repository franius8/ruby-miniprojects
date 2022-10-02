require 'pry-byebug'

def merge_sort(ary)
return ary if ary.length == 1
middle = ary.length/2 + ary.length % 2
merge merge_sort(ary[0...middle]), merge_sort(ary[middle..-1])
end


def merge(left, right)
  result = []
  until left.length == 0 || right.length == 0 do
    result << (left[0] <= right[0] ? left.shift : right.shift)
  end
  result + left + right
end

print merge_sort([3,1,5,2,7,4])