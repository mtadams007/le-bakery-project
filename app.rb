require 'sinatra'
require 'sinatra/reloader'
require 'sendgrid-ruby'
require_relative "classes.rb"
include SendGrid

get '/' do
  erb :index
end

get '/cookies' do
  erb :cookies
end

get '/muffins' do
  erb :muffins
end

get '/cakes' do
  erb :cakes
end
