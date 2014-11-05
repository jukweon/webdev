# app.rb
# this is a simple Sinatra example app

# use bundler
require 'rubygems'
require 'bundler/setup'
# load all of the gems in the gemfile
Bundler.require

# define a route for the root of the site
get '/' do
	# render the views/todo.erb template
	file_contents = File.read('todo.txt')
	@lists = file_contents.split("\n")
	erb :todo
end

require 'json'
post '/' do
	JSON.pretty_generate params
	File.open("todo.txt", "a") do |file|
    file.puts "#{params[:task]} - #{params[:date]}"
  end
end
