ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require './app/models/link'
require './app/models/tag'
require './app/models/user'
require './app/data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :'links/index'
  end

  post '/sign_up_complete' do
    @user = User.create(email: params[:email], password: params[:password])
    redirect to('/links')
  end

  get '/links' do
    @links = Link.all
    erb :'links/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:Link], title: params[:Title])
    params[:Tag].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/tags'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
