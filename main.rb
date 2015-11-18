require 'sinatra'

if settings.development?
  require 'pry'
  require 'sinatra/reloader'
end

require './class/items.rb'

helpers do
  include Rack::Utils
  alias_method :h, :escape_html

  def hbr(text)
    h(text).gsub(/\r\n|\r|\n/, "<br>")
  end
end
