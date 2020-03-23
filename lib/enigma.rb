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
        character_set[((shifts[type_shift(index % 4)] + character_set.index(char)) % 27)]
      end

      encrypt_msg.join
    end


    def decrypt_message(msg, shifts)
      decrypt_msg = msg.downcase.split('').map.with_index  do |char,index|
        character_set[((character_set.index(char) - shifts[type_shift(index % 4)]) % 27)]
        end

      decrypt_msg.join
    end

    def type_shift(index)
      shift_list = [:a_shift,:b_shift,:c_shift,:d_shift]

      shift_list[index]
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
