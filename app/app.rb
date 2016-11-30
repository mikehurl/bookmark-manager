ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require './app/models/links'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Links.all
    erb :'links/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    Links.create(url: params[:Link], title: params[:Title])
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
