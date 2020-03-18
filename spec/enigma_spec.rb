require 'rspec'
require './lib/calculate'
require './lib/enigma'

describe Enigma do
  describe '#encrypt' do
    it 'returns hash containing encryption, key, and date' do
      enigma = Enigma.new

      expect(enigma.encrypt("hello world", "02715", "040895")).to include({encryption: "keder ohulw", key: "02715", date: "040895"})
    end
    it 'raises error if message contains non a-z or space charaters' do
      enigma = Enigma.new


      expect{enigma.encrypt("he11o world", "02715", "040895")}.to raise_error(ArgumentError)
    end
  end
  describe '#decrypt' do
    it 'returns hash containing decryption, key, and date' do
      enigma = Enigma.new

      expect(enigma.decrypt("keder ohulw","02715", "040895")).to include({decryption: "hello world", key: "02715", date: "040895"})
    end
  end
end
