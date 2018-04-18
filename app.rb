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
  erb :cookies
end

get '/muffins' do
  erb :muffins
end

get '/cakes' do
  erb :cakes
end

post '/' do
  @new_email = params[:email]
  if @new_email != ''

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
    end
    erb :feedback
  end
