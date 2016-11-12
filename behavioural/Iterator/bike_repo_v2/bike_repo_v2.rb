require 'date'

class Bike
  include Comparable # Allows ordering of bikes

  attr_reader :ident, :stored_date
  def initialize(ident, stored_date)
    @ident = ident
    @stored_date = stored_date
  end

  def to_s
    "#{ident}:#{stored_date}"
  end

  def <=>(other)
    stored_date <=> other.stored_date
  end
end

# Container class
class BikeRepo
  # Added in v2, allows calls to #each
  include Enumerable
  attr_reader :collection

  def initialize(collection)
    @collection = collection
  end

  def add_bike(bike)
    collection << bike
  end

  # Must be implemented after including Enumerable
  def each(&block)
    collection.each(&block)
  end

  # After including Enumerable,
  # It also gets #all?, #none?, #include?, #min, #max
end

# Iterator
class Iterator
  attr_reader :collection, :index

  def initialize(collection)
    @collection = collection
    @index = 0
  end

  def has_next?
    index < collection.length
  end

  def item
    collection[index]
  end

  def next
    fail IndexError if index >= collection.length
    item = collection[index]
    increment_index
    item
  end

  # optional
  def remove
    item = collection[index]
    collection.delete(item) if period_exceeded(item)
  end

private

  def period_exceeded(item)
    (Date.today - item.stored_date) > 30
  end

  def increment_index
    @index = index + 1
  end
end
