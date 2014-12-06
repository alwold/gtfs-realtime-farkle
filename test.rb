require 'net/http'
require 'protobuf'
require './gtfs-realtime.pb'

data = Net::HTTP.get(URI('http://routes.valleymetro.org/api/tripupdates'))
FeedMessage.decode(data).entity.each do |entity|
  puts entity.trip_update.inspect
end
