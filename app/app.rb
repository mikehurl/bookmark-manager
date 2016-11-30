ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require './app/models/links'
require './app/data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @link = Link.all
    erb :'links/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    Link.create(url: params[:Link], title: params[:Title], tag: params[:Tag])
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
