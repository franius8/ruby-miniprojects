# frozen_string_literal: true

def letter?(number)
  number.between?(65, 90) || number.between?(97, 122)
end

def outside_range?(number, char)
  number > 122 || (char.ord.between?(65, 90) && number > 90)
end

def shift_value(number, char, shift)
  number += shift
  number -= 26 while outside_range?(number, char)
  number.chr
end

def return_shifted_value(char, shift)
  number = char.ord
  if letter?(number)
    shift_value(number, char, shift)
  else
    char
  end
end

def encode_string(string, shift)
  string.split('').reduce([]) do |final_array, char|
    final_array << return_shifted_value(char, shift)
  end
end

def caesar_cipher(string, shift)
  final_array = encode_string(string, shift)
  puts final_array.join('')
end

print 'Enter the phrase to encode: '
string = gets.chomp

print 'Enter the shift value: '
shift = gets.chomp.to_i

caesar_cipher(string, shift)
