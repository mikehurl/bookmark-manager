require 'sinatra/base'
require './app/models/links'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Links.all
    erb :links
  end

  get '/links/new' do
    erb :form
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
