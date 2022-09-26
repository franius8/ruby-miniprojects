# frozen_string_literal: true

def letter?(number)
  number.between?(65, 90) || number.between?(97, 122)
end

def outside_range?(number, char)
  number > 122 || (char.ord.between?(65, 90) && number > 90)
end

def caesar_cipher(string, shift)
  array = string.split('')
  final_array = []
  array.each do |char|
    number = char.ord
    if letter?(number)
      number += shift
      number -= 26 while outside_range?(number, char)
      final_array << number.chr
    else
      final_array << char
    end
  end
  puts final_array.join('')
end

print 'Enter the phrase to encode: '
string = gets.chomp

print 'Enter the shift value: '
shift = gets.chomp.to_i

caesar_cipher(string, shift)
