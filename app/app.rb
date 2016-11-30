
ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
    p @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb(:new_link)
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.first_or_create(name: params[:tag_name])
    link.tags << tag
    link.save
    link.tags.first
    redirect to('/links')
  end

  get '/tags/bubbles' do
    # @links = Link.all
    @links = Link.all.select {|link| link.tags.name == params[:tags]}
    erb(:filtered_tags)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
