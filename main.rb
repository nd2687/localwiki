require 'sinatra'

if settings.development?
  require 'pry'
  require 'sinatra/reloader'
end

require './class/items.rb'
