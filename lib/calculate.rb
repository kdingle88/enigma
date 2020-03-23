require 'date'

module Calculate
  extend self

    def character_set
      ("a".."z").to_a << " "
    end

    def format_date(date = Date.today.strftime("%m%d%y"))
      valid_date?(date) ? date : (raise ArgumentError)
    end

    def offsets(formatted_date)
      last_four_digits = offset_digits(formatted_date)
  
      {
        a_offset: last_four_digits[0],
        b_offset: last_four_digits[1],
        c_offset: last_four_digits[2],
        d_offset: last_four_digits[3]
      }
    end

    def keys(num_string = random_number_string)
      num_list = num_sets(num_string)

      { 
        a_key: num_list[0],
        b_key: num_list[1],
        c_key: num_list[2],
        d_key: num_list[3]
      }
    end

    def random_number_string
      number_string = rand(100000).to_s
    end
    

    def shift(key_hash,offset_hash)
      {
        a_shift: key_hash[:a_key].to_i + offset_hash[:a_offset],
        b_shift: key_hash[:b_key].to_i  + offset_hash[:b_offset],
        c_shift: key_hash[:c_key].to_i  + offset_hash[:c_offset],
        d_shift: key_hash[:d_key].to_i  + offset_hash[:d_offset],
      }
      
    end

    
  

    private

    def valid_date?(date)
      date.match?(/^\d+$/) && date.length == 6
    

    end

    def offset_digits(formatted_date)
      date_squared = formatted_date.to_i**2

      num = date_squared.to_s.split('').map {|x| x.to_i}.last(4)

      num
    end

    def num_sets(num_string)
      num_string.split('').each_cons(2).map(&:join)
    end

    

end


