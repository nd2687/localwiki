require 'sinatra'
require 'natto'

if settings.development?
  require 'pry'
  require 'sinatra/reloader'
end

require './class/items.rb'
require './class/user_csv.rb'
require './class/user_dic.rb'

helpers do
  include Rack::Utils
  alias_method :h, :escape_html

  def hbr(text)
    nm = Natto::MeCab.new

    sentence = ""
    sentence << "h('#{text}')"
    sentence << ".gsub(/\r\n|\r|\n/, '<br>')"
    nm.parse(text) do |string|
      Item.all.each do |item|
        name = item.name
        next if name == ""
        next if name =~ %r(^[+-.$()?*/&%!"'_,]+)
        next if name =~ /^[-.0-9]+$/

        if name == string.surface || name.capitalize == string.surface || name == string.surface.capitalize
          sentence << ".gsub("
          sentence << "/#{string.surface}/, "
          sentence << '"'
          sentence << "<a href='"
          sentence << "/items/#{item.id}"
          sentence << "'>#{string.surface}</a>"
          sentence << '"'
          sentence << ")"
        end
      end
    end

    eval sentence
  end

  def set_jtc(utc)
    utc.advance(hours: +9).strftime("%Y/%m/%d %H:%M")
  end
end
