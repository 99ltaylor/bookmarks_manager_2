require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/base'
require_relative 'lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader 
  end 

  get '/' do 
    "Bookmark Manager"
  end 

  get '/bookmarks' do
    @bookmarks = Bookmark.all # should return a list (array) of Bookmark instances
    # bookmark = @bookmarks.first
    # bookmark.title
    erb :index
  end


  run! if app_file == $0

end
