require 'sinatra'
require 'sinatra/reloader'
require 'sendgrid-ruby'
require_relative "classes.rb"
include SendGrid

#Cakes

$carrot = Cake.new("Carrot Cake", "A tasty cake made with organic carrots imported from Mbabane, Swaziland!", '$450', "/images/carrot_cake.jpeg")

$vanilla = Cake.new("Vanilla Cake", "A delicious cake made with imported vanilla from Ranomafana, Madagascar!", '$500', "/images/vanilla_cake.jpeg")

$strawberry = Cake.new("Strawberry Cake", "A scrumptious cake made with strawberries from Mongolia!", '$400', "/images/strawberry_cake.jpeg")

#Muffins

$cupcake = Muffin.new("Chocolate Cupcake", "A delicious sweet cupcake topped with chocolate icing", '$5', '/images/choco_muffin.jpeg')

$chocolate_muffin = Muffin.new("Chocolate Muffin", "A tasty dark chocolate muffin", '$4.34','/images/chocolate_muffin.jpeg')

$blueberry = Muffin.new("Blueberry Muffin", "An old favorite that is super tasty. The one time it's good to feel blue! We trained rabbits to pick the blueberries", "$3.21", "images/blueberry_muffin.jpeg")

$cookie_1 = Cookie.new("Chocolate Chip Cookie", "Everyone will want to chip in to finish this favorite cookie! Made with goat's milk chocolate.", "$1.43", "/images/choco_chip_cookie.jpeg")

$cookie_2 = Cookie.new("Christmas Cookies", "Yule love these cookies! Celebrate Christmas any time of the year! Made with all natural ingredients from Norway.", "$1.37", "/images/christmas_cookies.jpeg")

$cookie_3 = Cookie.new("Green Cookie", "A super healthy cookie that is also good for the environment. Your friends will turn green from envy! Made with kale, spinach, and iceberg lettuce", "$0.23", "/images/green_cookie.jpeg")

get '/catalog' do
  erb :catalog, :layout => :catalog_layout
end

get '/feedback' do
  erb :feedback
end

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

post '/' do
  new_email = params[:email]
  input_name = params[:name]
  from = Email.new(email: 'test@example.com')
  to = Email.new(email: new_email)
  subject = 'Le Bakery Catalog!'
  content = Content.new(type: 'text/plain', value: "Hi #{input_name} and thank you for signing up for the Le Bakery Catalog! I'm sure you'll find something tasty to eat!")
  mail = Mail.new(from, subject, to, content)
  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  erb :feedback
end
