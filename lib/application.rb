require 'haml'
require 'sass'
require 'sinatra/base'

class ApplicationController < Sinatra::Base

  enable :sessions

  set :root, File.join(File.dirname(__FILE__), '..')

  get '/' do
    haml :index
  end

  get '/css/*.css' do |style|
    sass :"stylesheets/#{style}"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
