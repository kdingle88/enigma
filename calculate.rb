require 'date'

module Calculate
  class << self
    def character_set
      ("a".."z").to_a << " "
    end

    def format_date(date = nil)
      today_date = Date.today
      x = date.match?(/^\d+$/) if date != nil

      raise ArgumentError if date != nil && date.length != 6
      raise ArgumentError if date != nil && !x
      
      return today_date.strftime("%m%d%y") if date == nil

      return date
    end
    def offsets(formatted_date)
      date_offsets = {
      a_offset:0,
      b_offset:0,
      c_offset:0,
      d_offset:0
    }

      date_squared = formatted_date.to_i**2

      last_four_digits = date_squared.to_s.split('').last(4).join.to_i.digits

      date_offsets[:a_offset] = last_four_digits[3]
      date_offsets[:b_offset] = last_four_digits[2]
      date_offsets[:c_offset] = last_four_digits[1]
      date_offsets[:d_offset] = last_four_digits[0]

      date_offsets
    end

    def keys(num_string = random_number_string)
      digit_keys = {
        a_key:'',
        b_key:'',
        c_key:'',
        d_key:'' }

      num_set = num_string.split('').each_cons(2).map(&:join)

      digit_keys[:a_key] = num_set[0]
      digit_keys[:b_key] = num_set[1]
      digit_keys[:c_key] = num_set[2]
      digit_keys[:d_key] = num_set[3]

      digit_keys
    end

    def random_number_string
      number_string = rand(100000).to_s

      while number_string.length < 5
        number_string = '0'+ number_string
      end

      number_string
    end

    def shift(key_hash,offset_hash)
      shift_hash = {
        a_shift: key_hash[:a_key].to_i + offset_hash[:a_offset],
        b_shift: key_hash[:b_key].to_i  + offset_hash[:b_offset],
        c_shift: key_hash[:c_key].to_i  + offset_hash[:c_offset],
        d_shift: key_hash[:d_key].to_i  + offset_hash[:d_offset],
      }
      shift_hash
    end
  end
end

