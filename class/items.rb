require 'active_record'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(:development)

db = SQLite3::Database.new('./db/localwiki.db')

db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(40) NOT NULL,
    description TEXT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
  );
SQL

class Item < ActiveRecord::Base
end

# delete
# enable :method_override

get '/' do
  @items = Item.all
  erb :index
end

post '/items/new' do
  item = Item.new
  item.name = params[:item][:name]
  item.description = params[:item][:description]
  item.save
  redirect '/'
end

get '/items/:id' do
  @item = Item.find(params[:id])
  @title = @item.name
  erb :show
end

get '/items/:id/edit' do
  @item = Item.find(params[:id])
  erb :edit
end

patch '/items/:id' do
  @item = Item.find(params[:id])
  if @item.update_attributes(params[:item])
    redirect "/items/#{params[:id]}"
  else
    redirect back
  end
end

delete '/items/:id' do
  @item = Item.find(params[:id])
  if @item.destroy
  else
  end
  redirect '/'
end
