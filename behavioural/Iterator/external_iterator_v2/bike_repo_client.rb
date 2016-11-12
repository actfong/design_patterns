require_relative "./bike_repo_v2"
require 'securerandom'

bike_1 = Bike.new(SecureRandom.base64(10), Date.today - 31)
bike_2 = Bike.new(SecureRandom.base64(10), Date.today - 30)
bike_3 = Bike.new(SecureRandom.base64(10), Date.today - 29)
bike_repo = BikeRepo.new([bike_1, bike_2, bike_3])

i1 = Iterator.new(bike_repo.collection)
# Loop through items
while i1.has_next?
  puts i1.next
end

i2 = Iterator.new(bike_repo.collection)
# Loop through items and remove
while i2.has_next?
  item = i2.remove
  i2.next unless item
end

puts "collection = #{i2.collection}"
puts "i2 collection length = #{i2.collection.length}"
puts "bike_repo collection length = #{bike_repo.collection.length}"

