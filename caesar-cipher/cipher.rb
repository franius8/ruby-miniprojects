require 'pry-byebug'

string = 'Zefir'
shift = 120

def caesar_cipher (string, shift)
    array = string.split('')
    final_array = Array.new
    array.each do |char|
        number = char.ord
        if number.between?(65, 90) || number.between?(97, 122)
            number += shift
           while number > 122 || (char.ord.between?(65, 90) && number > 90)
            number = number - 26
           end
           final_array << number.chr  
        else
            final_array << char 
        end
    end
    puts final_array.join('')
end

caesar_cipher(string, shift)