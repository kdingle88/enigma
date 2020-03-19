require 'rspec'
require './lib/enigma'

RSpec.describe Enigma do
  describe '#encrypt' do
    context 'contains params message, key, and date' do
      it 'returns hash with encrypted message, key, and date' do
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
    it 'returns hash containing decryption, key, and date' do
      expect(subject.decrypt("keder ohulw","02715", "040895")).to include({decryption: "hello world", key: "02715", date: "040895"})
    end
    context 'when message contains non a-z or space charaters' do
      it 'raises error' do
        expect{subject.decrypt("he11o world", "02715", "040895")}.to raise_error(ArgumentError)
      end
    end
  end
end
