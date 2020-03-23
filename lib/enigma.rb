require './lib/calculate'

class Enigma
  include Calculate

  def encrypt(message, key = random_number_string, date = format_date)

    message_match(message)
    pad_key = zero_padding(key)

    {
      encryption: encrpyt_message(message, shift(keys(key), offsets(date))),
      key: key,
      date: date
    }

  end

  def decrypt(message, key = random_number_string, date = format_date)

    message_match(message)
    pad_key = zero_padding(key)

    {
      decryption: decrypt_message(message, shift(keys(pad_key), offsets(date))),
      key: pad_key,
      date: date
    }
  
  end

  def crack(message, date = format_date)
    num_count = 0
    random_decrypt = decrypt(message, num_count.to_s,date)

    last_four_decrypt = random_decrypt[:decryption].split('').slice(-4,4).join

    until last_four_decrypt == " end"
      num_count+= 1
      random_decrypt = decrypt(message, num_count.to_s,date)
      last_four_decrypt = random_decrypt[:decryption].split('').slice(-4,4).join
    end

    random_decrypt
  end


  private
  
    def encrpyt_message(msg, shifts)
      encrypt_msg = msg.downcase.split('').map.with_index  do |char,index|
        index % 4 == 0 ? character_set[((shifts[:a_shift] + character_set.index(char)) % 27)] : 
        index % 4 == 1 ? character_set[((shifts[:b_shift] + character_set.index(char)) % 27)] :
        index % 4 == 2 ? character_set[((shifts[:c_shift] + character_set.index(char)) % 27)] : 
        character_set[((shifts[:d_shift] + character_set.index(char)) % 27)]
        end
      encrypt_msg.join
    end

    def decrypt_message(msg, shifts)
      decrypt_msg = msg.downcase.split('').map.with_index  do |char,index|
        index % 4 == 0 ? character_set[((character_set.index(char) - shifts[:a_shift]) % 27)] : 
        index % 4 == 1 ? character_set[((character_set.index(char) - shifts[:b_shift]) % 27)] :
        index % 4 == 2 ? character_set[((character_set.index(char) - shifts[:c_shift]) % 27)] : 
        character_set[((character_set.index(char) - shifts[:d_shift]) % 27)]
        end
      decrypt_msg.join
    end

    def message_match(message)
      message.match?(/^[a-zA-Z\s]*$/) ? message : (raise ArgumentError)
    end
    
    def zero_padding(num_string)
      while num_string.length < 5
        num_string = '0'+ num_string
      end

      num_string
    end
end
