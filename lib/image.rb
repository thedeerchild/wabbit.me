require 'rmagick'
include Magick

def generate_image width, height, color, format
  ilist = Magick::ImageList.new('./data/1.jpg')
  # img = Image.new(width.to_i, height.to_i) { self.background_color = "red" }
  # img = Image.read('./data/1.jpg')
  ilist.resize_to_fill! width, height
  if color
    overlay_color = Pixel.new(color[0..1].to_i(16)*256,color[2..3].to_i(16)*256,color[4..5].to_i(16)*256,0.25*65535)
    ilist.new_image(width, height) {self.background_color = overlay_color }
  end
  img = ilist.flatten_images
  img.format = format
  img.to_blob
end