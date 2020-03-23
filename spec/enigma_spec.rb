require 'rspec'
require './lib/enigma'


RSpec.describe Enigma do
  describe '#encrypt' do
    context 'contains params message, key, and date' do
      it 'returns hash with message, key, and date' do
        msg = "hello world"
        key = "02715"
        date ="040895"

        expect(subject.encrypt(msg, key, date)).to include({encryption: "keder ohulw", key: key, date: date})
      end
    end

    context 'when message contains non a-z or space charaters' do
      it 'raises error' do
        msg = "he11o world"
        key = "02715"
        date ="040895"

        expect{subject.encrypt(msg, key, date)}.to raise_error(ArgumentError)
      end
    end
  end

  describe '#decrypt' do
    it 'returns hash containing encrypted message, key, and date' do
      msg = "keder ohulw"
      key = "02715"
      date ="040895"

      expect(subject.decrypt(msg,key,date)).to include({decryption: "hello world", key: key, date: date})
    end
    context 'when message contains non a-z or space charaters' do
      it 'raises error' do
        expect{subject.decrypt("he11o world", "02715", "040895")}.to raise_error(ArgumentError)
      end
    end
  end
  describe '#crack' do 
    context 'contains params encrypted message and date' do
      it 'returns hash containing decripted message, key, and date' do
        msg = "vjqtbeaweqihssi"
        date ="291018"
        
        expect(subject.crack(msg,date)).to include({decryption: "hello world end",date: date,key: "08304"})
      end
    end
  end 
end
