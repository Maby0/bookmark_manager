require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/base'
require_relative 'lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :method_override

  configure :development do 
    register Sinatra::Reloader 
  end 

  get '/' do 
    "Bookmark Manager"
  end 

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/adding' do
    Bookmark.create(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end



  run! if app_file == $0

end
