def fibonacci(n)
    n1 = 0
    n2 = 1
    temp = 0
    result = [1]

    (n-1).times do
        temp = n2;
        n2 = n1 + n2;
        n1 = temp;
        result << n2
    end
    result
end

def fibonacci_rec (n)
    return [0] if n == 0
    return [0, 1] if n == 1
  
    ary = fibonacci_rec(n - 1)
    ary << ary[-2] + ary[-1]
end


puts fibonacci_rec(gets.chomp.to_i)