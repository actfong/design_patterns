class BasicSandwich
  attr_reader :ingredients
  attr_writer :vegetarian
  attr_accessor :temperature

  def initialize
    @ingredients = ['bread']
    @vegetarian = true
    @temperature = 'cold'
  end

  def make
    'Starting with bread'
  end
end
