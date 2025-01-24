# Write your solution here!
require "rqrcode"



### For link: # qrcode = RQRCode::QRCode.new("https://en.wikipedia.org/wiki/QR_code")
### For wifi: # qrcode = RQRCode::QRCode.new(WIFI:T:WPA;S:My wifi network;P:supersecretpassword;;)
### For text message # SMSTO:9876543210:Hi Alice! It's

puts "What kind of QR code would you like to generate?\n
      1.  Open a URL
      2.  Join a wifi network
      3.  Send a text message
      
      Press 4 to exit\n\n"

response = gets.chomp
qr_type = nil

if response == "1"
  qr_type = "url"
elsif response == "2"
  qr_type = "wifi"
elsif response == "3"
  qr_type = "text"
elsif response == "4"
  puts "Goodbye!"
  exit
else
  puts "Didn't recognize that seleection. Please try again\n\n"
end

puts "The qr type is #{qr_type}"

qrcode = RQRCode::QRCode.new("SMSTO:9492928454:You are soooo good looking")



# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite("sometext.png", png.to_s)
