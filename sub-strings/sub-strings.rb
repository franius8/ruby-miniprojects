dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings (string, dictionary)
    main_string = string.downcase
    result = Hash.new(0)
    dictionary.each do |word|
        if main_string.include?(word)
            result[word] = main_string.scan(word).length
        end
    end
    if result == {}
        puts "No matches found!"
    else    
        puts result
    end
end

puts "The dictionary is:"
puts "#{dictionary} \n"

puts "Enter your string: "
strings = gets.chomp

substrings(strings, dictionary)