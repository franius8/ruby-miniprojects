# frozen_string_literal: true


class CaesarCipher
  def initialize
    loop do
      puts 'Welcome to Caesar Cipher!'
      puts 'Press 1 to encode or 2 to decode'
      case gets.chomp.to_i
      when 1
      CipherEncode.new
      when 2
      decode
      else
      puts 'Invalid selection, try again'
      end 
    end
  end
end

class CipherEncode
  def initialize
    print 'Enter the phrase to encode: '
    @string = gets.chomp

    print 'Enter the shift value: '
    @shift = gets.chomp.to_i

    @final_array = []
    caesar_encode
  end

  def caesar_encode
    encode_string(@string, @shift)
    puts @final_array.join('')
  end

  def encode_string(string, shift)
    string.split('').each do |char|
      @final_array << return_shifted_value(char)
    end
  end

  def return_shifted_value(char)
    @number = char.ord
    if letter?
      shift_value(char)
    else
      char
    end
  end

  def shift_value(char)
    @number += @shift
    @number -= 26 while outside_range?(char)
    @number.chr
  end

  def letter?
    @number.between?(65, 90) || @number.between?(97, 122)
  end
  
  def outside_range?(char)
    @number > 122 || (char.ord.between?(65, 90) && @number > 90)
  end
end

CaesarCipher.new
