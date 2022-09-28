# frozen_string_literal: true

# Module with elements used in both decode and encode classes
module CommonElements
  def perform_shift
    get_user_input
    put_result
  end
  
  def get_user_input
    print "Enter the phrase to #{@mode}: "
    @string = gets.chomp

    print 'Enter the shift value: '
    @shift = gets.chomp.to_i
  end

  def return_shifted_value
    @number = @char.ord
    if letter?
      shift_value
    else
      char
    end
  end

  def put_result
    shift_string
    puts @final_array.join('')
  end

  def shift_string
    @string.split('').each do |char|
      @char = char
      @final_array << return_shifted_value
    end
  end

  def letter?
    @number.between?(65, 90) || @number.between?(97, 122)
  end

end

# Class initializing the cipher
class CaesarCipher
  def initialize
    loop do
      puts 'Welcome to Caesar Cipher!'
      puts 'Press 1 to encode or 2 to decode'
      case gets.chomp.to_i
      when 1 then CipherEncode.new
      when 2 then CipherDecode.new
      else puts 'Invalid selection, try again'
      end
    end
  end
end

# Class for encoding strings
class CipherEncode
  include CommonElements
  def initialize
    @mode = 'encode'
    @final_array = []
    perform_shift
  end

  def shift_value
    @number += @shift
    @number -= 26 while outside_range?
    @number.chr
  end

  def outside_range?
    @number > 122 || (@char.ord.between?(65, 90) && @number > 90)
  end
end

# Class for decoding the string
class CipherDecode
  include CommonElements
  def initialize
    @mode = 'decode'
    @final_array = []
    perform_shift
  end

  def shift_value
    @number -= @shift
    @number += 26 while outside_range?
    @number.chr
  end

  def outside_range?
    @number < 65 || (@char.ord.between?(97, 122) && @number < 97)
  end
end

CaesarCipher.new
