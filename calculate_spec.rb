require 'rspec/autorun'
require 'date'
require_relative 'calculate'

describe Calculate do
  describe '::character_set' do
    it 'returns array of lowercase alphabet plus space' do
      expect(Calculate.character_set).to eql(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
    end
  end

  describe '::format_date' do
    it 'returns todays date formated' do
      today_date = Date.today
      today_date_formatted = today_date.strftime("%m%d%y")

      expect(Calculate.format_date).to eql(today_date_formatted)
    end
    it 'if date passed in, return passed in value' do
      expect(Calculate.format_date("123456")).to eql("123456")
    end
    it 'if date passed in, raises error if length does not equal 6' do
      expect{Calculate.format_date("31420")}.to raise_error(ArgumentError)
    end
    it 'if date passed in, raises error if contains characters besides numbers' do
      expect{Calculate.format_date("453f34")}.to raise_error(ArgumentError)
    end
  end
  
  describe '::offsets' do
    
    it 'returns hash containing last four digits of date squared' do
      formatted_date = '011519'

      expect(Calculate.offsets(formatted_date)).to include({a_offset:7,b_offset:3,c_offset:6,d_offset:1 })
    end
    it 'returns hash containing last four digits of date squared test 2' do
      formatted_date = '011517'

      expect(Calculate.offsets(formatted_date)).to include({a_offset:1,b_offset:2,c_offset:8,d_offset:9 })
    end
    
  end

  describe '::keys' do
    it 'splits random 5 digit number into 4 two-digit hash entries' do
      random_number = "02715"

      expect(Calculate.keys(random_number)).to include({a_key:'02',b_key:'27',c_key:'71',d_key:'15' })
    end

    it 'splits random 5 digit number into 4 two-digit hash entries test 2' do
      random_number = "00813"

      expect(Calculate.keys(random_number)).to include({a_key:'00',b_key:'08',c_key:'81',d_key:'13' })
    end
  end

  describe '::random_number_string' do
  
  it 'generates random number string with leading zeros if neccessary thats equal to 5 digits in length'
  end
  end

  describe '::shifts' do
  skip
  end
end