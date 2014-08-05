require 'rmagick'
include Magick

def generate_image width, height, format
  img = Image.new(width.to_i, height.to_i) { self.background_color = "red" }
  img.format = format
  img.to_blob
end