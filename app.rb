require 'sinatra'
require 'sinatra/reloader'
require 'sendgrid-ruby'
require_relative "classes.rb"
include SendGrid

$carrot = Cake.new("Carrot Cake", "A tasty cake made with organic carrots imported from Mbabane, Swaziland!", '$450', "/images/carrot_cake.jpeg")

$vanilla = Cake.new("Vanilla Cake", "A delicious cake made with imported vanilla from Ranomafana, Madagascar!", '$500', "/images/vanilla_cake.jpeg")

$strawberry = Cake.new("Strawberry Cake", "A scrumptious cake made with strawberries from Mongolia!", '$400', "/images/strawberry_cake.jpeg")


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
