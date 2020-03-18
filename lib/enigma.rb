require './lib/calculate'

class Enigma
  def encrypt(message, key = Calculate.random_number_string, date = Calculate.format_date)

    raise ArgumentError if !message.match?(/^[a-zA-Z\s]*$/)

    encrypt_chars = Calculate.character_set

    char_offsets = Calculate.offsets(date)

    key_hash = Calculate.keys(key)

    char_shifts = Calculate.shift(key_hash, char_offsets)

    message_array = message.downcase.split('')

    encrypt_message = message_array.map.with_index  do |char,index|
    if index % 4 ==0
      new_index = char_shifts[:a_shift] + encrypt_chars.index(char)

      encrypt_chars[(new_index % 27)]

    elsif index % 4 ==1
      new_index = char_shifts[:b_shift] + encrypt_chars.index(char)

      encrypt_chars[(new_index % 27)]

    elsif index % 4 ==2
      new_index = char_shifts[:c_shift] + encrypt_chars.index(char)

      encrypt_chars[(new_index % 27)]

    elsif index % 4 ==3
      new_index = char_shifts[:d_shift] + encrypt_chars.index(char)

      encrypt_chars[(new_index % 27)]
    end
  end

    {
      encryption: encrypt_message.join,
      key: key,
      date: date
    }

  end
  def decrypt(message, key = Calculate.random_number_string, date = Calculate.format_date)
    #Do error checking raise errors if message contains non a-z
    raise ArgumentError if !message.match?(/^[a-zA-Z\s]*$/)

    decrypt_chars = Calculate.character_set

    char_offsets = Calculate.offsets(date)

    key_hash = Calculate.keys(key)

    char_shifts = Calculate.shift(key_hash, char_offsets)

    message_array = message.downcase.split('')

    decrypt_message = message_array.map.with_index  do |char,index|
    if index % 4 ==0
      new_index = decrypt_chars.index(char) - char_shifts[:a_shift]

      decrypt_chars[(new_index % 27)]

    elsif index % 4 ==1
      new_index = decrypt_chars.index(char) - char_shifts[:b_shift]

      decrypt_chars[(new_index % 27)]

    elsif index % 4 ==2
      new_index = decrypt_chars.index(char) - char_shifts[:c_shift]

      decrypt_chars[(new_index % 27)]

    elsif index % 4 ==3
      new_index = decrypt_chars.index(char) -char_shifts[:d_shift]

      decrypt_chars[(new_index % 27)]
    end
  end

    {
      decryption: decrypt_message.join,
      key: key,
      date: date
    }
  end
end





