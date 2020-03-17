require './lib/enigma.rb'

enigma = Enigma.new

message_file = File.open(ARGV[0],"r")

encrypt_message = enigma.decrypt(message_file.read,ARGV[2],ARGV[3])

decrypt_file = File.open(ARGV[1], "w")

decrypt_file.write(encrypt_message[:decryption])

puts "Contents in #{ARGV[0]} decrypted and stored in #{ARGV[1]} with key #{encrypt_message[:key]} and date #{encrypt_message[:date]}"