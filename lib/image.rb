require 'rmagick'
include Magick

def generate_image width, height
  img = Image.new(width.to_int, height.to_int) { self.background_color = "red" }
  img.format = 'jpg'
  img.to_blob
end