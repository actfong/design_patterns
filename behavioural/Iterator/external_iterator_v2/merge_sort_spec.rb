require_relative "./bike_repo_v2"
require_relative "./merge_sort"

require 'minitest/autorun'

describe 'merge_sort' do
  let(:bike_1) { Bike.new(1, Date.today - 31) }
  let(:bike_2) { Bike.new(2, Date.today - 30) }
  let(:bike_3) { Bike.new(3, Date.today - 26) }
  let(:bike_repo_1) { BikeRepo.new([bike_1, bike_2, bike_3]) }

  let(:bike_a) { Bike.new('a', Date.today - 60) }
  let(:bike_b) { Bike.new('b', Date.today - 20) }
  let(:bike_c) { Bike.new('c', Date.today - 29) }
  let(:bike_repo_2) { BikeRepo.new([bike_a, bike_b, bike_c]) }

  it 'returns a sorted array from two sorted arrays' do
    res = merge_sort(bike_repo_1.collection.sort, bike_repo_2.collection.sort)
    res.must_equal [bike_a, bike_1, bike_2, bike_c, bike_3, bike_b]
  end
end
