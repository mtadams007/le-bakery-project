require 'sinatra'
require 'sinatra/reloader'
require 'sendgrid-ruby'
require_relative "classes.rb"
include SendGrid

get '/feedback' do
  erb :feedback
end

get '/catalog/muffins' do
  erb :catalog_muffins, :layout => :catalog_layout
end

get '/catalog/cookies' do
  erb :catalog_cookies, :layout => :catalog_layout
end

get '/catalog/cakes' do
  erb :catalog, :layout => :catalog_layout
end

get '/feedback' do
  erb :feedback
end

get '/' do
  erb :index
end

get '/cookies' do
  @choco_chip = Cookie.new("Chocolate Chip Cookie", "Everyone will want to chip in to finish this favorite cookie! Made with goat's milk chocolate.", "$1.43", "/images/choco_chip_cookie.jpeg")
  @christmas = Cookie.new("Christmas Cookies", "Yule love these cookies! Celebrate Christmas any time of the year! Made with all natural ingredients from Norway.", "$1.37", "/images/christmas_cookies.jpeg")
  @green = Cookie.new("Green Cookie", "A super healthy cookie that is also good for the environment. Your friends will turn green from envy! Made with kale, spinach, and iceberg lettuce", "$0.23", "/images/green_cookie.jpeg")
  @cookie_hash = {
    cookie_1: @choco_chip,
    cookie_2: @christmas,
    cookie_3: @green
  }
  erb :cookies
end

get '/muffins' do
  @cupcake = Muffin.new("Chocolate Cupcake", "A delicious sweet cupcake topped with chocolate icing", '$5', '/images/choco_muffin.jpeg')
  @chocolate_muffin = Muffin.new("Chocolate Muffin", "A tasty dark chocolate muffin", '$4.34','/images/chocolate_muffin.jpeg')
  @blueberry = Muffin.new("Blueberry Muffin", "An old favorite that is super tasty. The one time it's good to feel blue! We trained rabbits to pick the blueberries", "$3.21", "/images/blueberry_muffin.jpeg")
  @muffin_hash = {
    muffin_1: @cupcake,
    muffin_2: @chocolate_muffin,
    muffin_3: @blueberry
  }
  erb :muffins
end

get '/cakes' do
  @carrot = Cake.new("Carrot Cake", "A tasty cake made with organic carrots imported from Mbabane, Swaziland is better than gold!", '$450', "/images/carrot_cake.jpeg")
  @vanilla = Cake.new("Vanilla Cake", "A delicious cake made with imported vanilla from Ranomafana, Madagascar will make you the best you've ever bean!", '$500', "/images/vanilla_cake.jpeg")
  @strawberry = Cake.new("Strawberry Cake", "You'll never draw the shortest straw with this scrumptious cake made with strawberries from Mongolia!", '$400', "/images/strawberry_cake.jpeg")
  @cake_hash = {
    cake_1: @carrot,
    cake_2: @vanilla,
    cake_3: @strawberry
  }
  erb :cakes
end

post '/' do
  @new_email = params[:email]
  if  @new_email != ''
    @input_name = params[:name]
    from = Email.new(email: 'test@example.com')
    to = Email.new(email: @new_email)
    subject = 'Le Bakery Catalog!'
    content = Content.new(type: 'text/html', value: "<table>
      <tr>
      <td>Hi #{@input_name} and thank you for signing up for the Le Bakery Catalog! I'm sure you'll find something tasty to eat!</td>
      </tr>
      <tr>
      <td><img src=/images/catalog_cakes.jpeg></td>
      </tr>
      <tr>
      <td><img src='/images/catalog_muffins.jpeg'></td>
      </tr>
      <tr>
      <td><img src='/images/catalog_cookies.jpeg'></td>
      </tr>
      </table>")
      mail = Mail.new(from, subject, to, content)
      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
    end
    erb :feedback
  end
