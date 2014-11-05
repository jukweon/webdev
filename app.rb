# app.rb
# this is a simple Sinatra example app

# use bundler
require 'rubygems'
require 'bundler/setup'
# load all of the gems in the gemfile
Bundler.require

require './models/TodoItem'

ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => 'db/development.db',
  :encoding => 'utf8'
  )

get '/' do
  all_items = TodoItem.all
  @task = all_items.order(:due_date)
  erb :todo
end

post '/' do
  TodoItem.create(description: params[:task], due_date: params[:date])
  redirect '/'
end

post '/delete' do
  TodoItem.find_by(description: params[:task]).destroy
  redirect '/'
end
