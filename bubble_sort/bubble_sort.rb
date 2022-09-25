def switch_pair (array, number, index)
    array[index] = array[index - 1]
    array[index - 1] = number
    array
end

def is_next_smaller?(array, number, index)
    number < array[index - 1]
end

def bubble_sort (array)
    sorted = false
    until sorted == true
        sorted = true
        array.each_with_index do |number, index|
            unless index == 0
                if is_next_smaller?(array, number, index)
                    switch_pair(array, number, index)
                    sorted = false
                end
            end
        end
    end
    puts array
end

bubble_sort([4,3,78,2,0,1])