def bubble_sort (array)
    sorted = false
    until sorted == true
        sorted = true
        array.each_with_index do |number, index|
            unless index == 0
                if number < array[index - 1]
                    array[index] = array[index - 1]
                    array[index - 1] = number
                    sorted = false
                end
            end
        end
    end
    puts array
end

bubble_sort([4,3,78,2,0,2])