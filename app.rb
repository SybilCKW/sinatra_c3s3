require 'sinatra'
require 'csv'

get '/' do
  erb :index
end

get '/todo' do
  @todo = ['Order canapes', 'Confirm event details with attendees', 'Book band']

  erb :todo
end

get '/schedule' do
  @schedule = [ ['8pm',    'Doors open'],
                ['8.30pm', 'Champagne and canapes served'],
                ['9pm',    'Speech'],
                ['9.30pm', 'Painting unveiled'],
                ['9.40pm', 'Live band plays'] ]

  erb :schedule
end

get '/attendees' do
  @rsvps = CSV.read('rsvps.csv')

  erb :rsvps
end