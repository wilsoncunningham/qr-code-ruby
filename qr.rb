# Write your solution here!
require "rqrcode"



### For link: # qrcode = RQRCode::QRCode.new("https://en.wikipedia.org/wiki/QR_code")
### For wifi: # qrcode = RQRCode::QRCode.new(WIFI:T:WPA;S:My wifi network;P:supersecretpassword;;)
### For text message # SMSTO:9876543210:Hi Alice! It's

qrcode = RQRCode::QRCode.new("SMSTO:9492928454:You are soooo good looking")



# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite("sometext.png", png.to_s)
