require 'sinatra'
require './lib/image'

configure {
  set :server, :puma
}
 
class Pumatra < Sinatra::Base
  get '/:width/:height.?:format?/?:color?.?:format?/?:image_id?.?:format?' do
    return params.inspect
    # content_type 'image/jpg'
    # generate_image params[:width], params[:height]
  end
 
  run! if app_file == $0
end