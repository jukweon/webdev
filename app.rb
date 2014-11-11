# app.rb
# this is a simple Sinatra example app

# use bundler
require 'rubygems'
require 'bundler/setup'
# load all of the gems in the gemfile
Bundler.require

require './models/TodoItem'
require './models/User'

if ENV['DATABASE_URL']
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
else
  ActiveRecord::Base.establish_connection(
    :adapter  => 'sqlite3',
    :database => 'db/development.db',
    :encoding => 'utf8'
  )
end

get '/' do
  all_users = Users.all
  @user = all_users.order(:name)
  erb:user
end

post '/' do
  @user = User.create(name: params[:name])
  redirect '/'
end

get '/:name' do
  @user = User.find_by(name: params[:name])
  @task = @user.todo_items.order(:due_date)
  erb :todo
end

post '/:name' do
  userID = User.find_by(name: params[:name]).id
  TodoItem.create(description: params[:item], due_date: params[:date], userid:userID)
  redirect '/#{params[:name]}'

get '/:name/delete' do
  User.find_by(name: params[:name]).destroy
  redirect '/'
end

get '/:name/delete/:id' do
  TodoItem.find_by(id: params[:id]).destroy
  redirect '/#{params[:name]}'
end
