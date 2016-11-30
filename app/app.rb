ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require './app/models/link'
require './app/models/tag'
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
    link = Link.new(url: params[:Link], title: params[:Title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect to '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
