require 'sinatra'
require './lib/image'

configure {
  set :server, :puma
}
 
class Pumatra < Sinatra::Base
  get '/:width/:height.?:format?/?:color?.?:format?/?:image_id?.?:format?' do
    format = if (params[:format] && %w(jpg jpeg png gif).include?(params[:format]))
      params[:format]
    else
      'jpg'
    end
    content_type "image/#{format}"
    generate_image params[:width], params[:height], format
  end
 
  run! if app_file == $0
end