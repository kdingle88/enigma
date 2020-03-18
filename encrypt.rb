require_relative 'enigma.rb'

enigma = Enigma.new

message_file = File.open(ARGV[0],"r")

encrypt_message = enigma.encrypt(message_file.read)

encrypt_file = File.open(ARGV[1], "w")

encrypt_file.write(encrypt_message[:encryption])

puts "Contents in #{ARGV[0]} encrypted and stored in #{ARGV[1]} with key #{encrypt_message[:key]} and date #{encrypt_message[:date]}"

