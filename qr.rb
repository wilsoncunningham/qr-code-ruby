# Write your solution here!
require "rqrcode"


puts "What kind of QR code would you like to generate?\n
      1.  Open a URL
      2.  Join a wifi network
      3.  Send a text message
      
      Press 4 to exit\n\n"


response = nil

until response == "1" || response == "2" || response == "3" ||response == "4" do
  response = gets.chomp
  puts "Didn't recognize that selection. Please try again\n\n"
end

if response == "1"
  puts "\nWhat URL would you like to encode?"
  url = gets.chomp

  puts "\nWhat would you like to call the PNG?"
  png_name = gets.chomp

  qrcode = RQRCode::QRCode.new(url)

elsif response == "2"
  puts "\nWhat is the name of the wifi network?"
  network = gets.chomp

  puts "\nWhat is the password?"
  password = gets.chomp

  puts "\nWhat would you like to call the PNG?"
  png_name = gets.chomp

  qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{network};P:#{password};;")

elsif response == "3"
  puts "\nWhat is the phone number you want to send a text to?"
  number = gets.chomp

  puts "\nWhat do you want to populate the message with?"
  message = gets.chomp

  puts "\nWhat would you like to call the PNG?"
  png_name = gets.chomp

  qrcode = RQRCode::QRCode.new("SMSTO:#{number}:#{message}")

elsif response == "4"
  puts "Goodbye!"
  exit
end


# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({:size => 500})

# Write the image data to a file
IO.binwrite("#{png_name}.png", png.to_s)
