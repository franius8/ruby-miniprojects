# frozen_string_literal: true

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def dictionary_check(dictionary, main_string)
  result = {}
  dictionary.each do |word|
    result[word] = main_string.scan(word).length if main_string.include?(word)
  end
  result
end

def substrings(string, dictionary)
  main_string = string.downcase
  result = dictionary_check(dictionary, main_string)
  if result == {}
    puts 'No matches found!'
  else
    puts result
  end
end

puts 'The dictionary is:'
puts "#{dictionary} \n"

puts 'Enter your string: '
strings = gets.chomp

substrings(strings, dictionary)
