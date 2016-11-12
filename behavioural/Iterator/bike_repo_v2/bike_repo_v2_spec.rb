require_relative "./bike_repo_v2"
require 'securerandom'
require 'minitest/autorun'

describe Bike do
  let(:bike_1) { Bike.new(SecureRandom.base64(10), Date.today - 31) }
  let(:bike_2) { Bike.new(SecureRandom.base64(10), Date.today - 29) }

  describe '#<=>' do
    it 'sort by stored_date ASC' do
      (bike_1 < bike_2).must_equal true
    end
  end
end

describe BikeRepo do
  let(:bike_1) { Bike.new(SecureRandom.base64(10), Date.today - 31) }
  let(:bike_2) { Bike.new(SecureRandom.base64(10), Date.today - 29) }
  let(:bike_3) { Bike.new(SecureRandom.base64(10), Date.today - 30) }

  let(:bike_repo) { BikeRepo.new([bike_1, bike_2]) }

  describe '#add_bike' do
    it 'adds bike to collection' do
      bike_repo.collection.count.must_equal 2
      bike_repo.add_bike bike_3
      bike_repo.collection.count.must_equal 3
    end
  end

  describe '#sort' do
    it 'sorts by stored_date ASC' do
      bike_repo.add_bike bike_3
      bike_repo.sort.must_equal [bike_1, bike_3, bike_2]
    end
  end

  describe '#min' do
    it 'return bike that was stored first' do
      bike_repo.min.must_equal bike_1
    end
  end

  describe '#max' do
    it 'return bike that was stored last' do
      bike_repo.max.must_equal bike_2
    end
  end
end

describe Iterator do
  let(:bike_1) { Bike.new(SecureRandom.base64(10), Date.today - 31) }
  let(:bike_2) { Bike.new(SecureRandom.base64(10), Date.today - 30) }
  let(:bike_3) { Bike.new(SecureRandom.base64(10), Date.today - 29) }
  let(:iterator) { Iterator.new([bike_1, bike_2, bike_3]) }

  describe 'has_next?' do
    it 'returns true when index < collection.size' do
      iterator.next
      iterator.has_next?.must_equal true
    end

    it 'returns false when index >= collection.size' do
      3.times { iterator.next }
      iterator.has_next?.must_equal false
    end
  end

  describe 'item' do
    it 'returns item from the current index' do
      iterator.item.must_equal bike_1
      iterator.next
      iterator.item.must_equal bike_2
    end
  end

  describe 'next' do
    it 'returns item from current index and increments index' do
      iterator.next.must_equal bike_1
      iterator.next.must_equal bike_2
      iterator.next.must_equal bike_3
    end
  end

  describe 'remove' do
    it 'removes item if period has exceeded' do
      iterator.remove.must_equal bike_1
      iterator.remove.must_be_nil
      iterator.next
      iterator.remove.must_be_nil
      iterator.collection.must_equal [bike_2, bike_3]
    end
  end
end
