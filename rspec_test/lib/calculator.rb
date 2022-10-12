class Calculator
    def add(*numbers)
        return nil if numbers.empty?
        numbers.reduce(0) {|result, number| number += result}
    end

    def subtract(*numbers)
        return nil if numbers.empty?
        numbers.reduce(nil) do |result, number|
            if result == nil
                result = number
            else
                result -= number
            end
        end
    end
end