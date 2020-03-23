require './lib/enigma.rb'

enigma = Enigma.new

encrypted_file = File.open(ARGV[0],"r")

cracked_message = enigma.crack(encrypted_file.read,ARGV[2])

crack_file = File.open(ARGV[1], "w")

crack_file.write(cracked_message[:decryption])

puts "Created #{ARGV[1]} with the cracked key #{cracked_message[:key]} and date #{cracked_message[:date]}"