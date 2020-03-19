require './lib/calculate'

class Enigma
  include Calculate

  def encrypt(message, key = random_number_string, date = format_date)

    message_match(message)

    {
      encryption: encrpyt_message(message, shift(keys(key), offsets(date))),
      key: key,
      date: date
    }

  end

  def decrypt(message, key = random_number_string, date = format_date)

    message_match(message)

    {
      decryption: decrypt_message(message, shift(keys(key), offsets(date))),
      key: key,
      date: date
    }
  
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
end

