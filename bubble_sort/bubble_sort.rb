# frozen_string_literal: true

def switch_pair(array, number, index)
  array[index] = array[index - 1]
  array[index - 1] = number
end

def next_smaller?(array, number, index)
  number < array[index - 1]
end

def switch_until_sorted(array)
  sorted = false
  until sorted == true
    sorted = true
    array.each_with_index do |number, index|
      if index != 0 && next_smaller?(array, number, index)
        switch_pair(array, number, index)
        sorted = false
      end
    end
  end
end

def bubble_sort(array)
  switch_until_sorted(array)
  puts array
end

bubble_sort([4, 3, 78, 2, 0, 1])
