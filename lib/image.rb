require 'rmagick'
include Magick

def generate_image width, height
  img = Image.new(width.to_i, height.to_i) { self.background_color = "red" }
  img.format = 'jpg'
  img.to_blob
end