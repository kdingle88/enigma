require 'rspec'
require './lib/enigma'


RSpec.describe Enigma do
  describe '#encrypt' do
    context 'contains params message, key, and date' do
      it 'returns hash with message, key, and date' do
        expect(subject.encrypt("hello world", "02715", "040895")).to include({encryption: "keder ohulw", key: "02715", date: "040895"})
      end
    end

    context 'when message contains non a-z or space charaters' do
      it 'raises error' do
        expect{subject.encrypt("he11o world", "02715", "040895")}.to raise_error(ArgumentError)
      end
    end
  end

  describe '#decrypt' do
    it 'returns hash containing encrypted message, key, and date' do
      expect(subject.decrypt("keder ohulw","02715", "040895")).to include({decryption: "hello world", key: "02715", date: "040895"})
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
        expect(subject.crack("vjqtbeaweqihssi","291018")).to include({decryption: "hello world end",date: "291018",key: "08304"})
      end
    end
  end 
end
