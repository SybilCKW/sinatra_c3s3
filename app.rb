require 'sinatra'
require 'csv'

get '/' do
  erb :index
end

get '/todo' do
  @todos = [
    'Order canapes',
    'Confirm event details with attendees',
    'Book band', #comma at start makes it easy to comment out item?
    'Buy drinks'
  ]

  erb :todo
end

get '/schedule' do
  @schedule = [ ['8pm',    'Doors open'],
                ['9.30pm', 'Painting unveiled'],
                ['9pm',    'Speech'],
                ['8.30pm', 'Champagne and canapes served'],
                ['9.40pm', 'Live band plays'] ]

  erb :schedule
end

get '/rsvps' do
  @rsvps = CSV.read('rsvps.csv')

  @acceptances = []
  @rejections  = []

  @rsvps.each do |rsvpPerson|
    if rsvpPerson[1] == "yes"
      @acceptances << rsvpPerson[0]
    else
      @rejections << rsvpPerson[0]
    end
  end

  @acceptance_count = @acceptances.length
  @rejection_count  = @rejections.length

  erb :rsvps
end