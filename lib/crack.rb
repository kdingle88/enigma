require './lib/enigma.rb'

enigma = Enigma.new

message_file = File.open(ARGV[0],"r")

encrypt_message = enigma.crack(message_file.read,ARGV[2])

crack_file = File.open(ARGV[1], "w")

crack_file.write(encrypt_message[:decryption])

puts "Created #{ARGV[1]} with the cracked key #{encrypt_message[:key]} and date #{encrypt_message[:date]}"