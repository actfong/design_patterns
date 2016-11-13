require 'forwardable'
class SandwichDecorator
  extend Forwardable
  def_delegators :@sandwich, :ingredients, :make, :vegetarian, :vegetarian=, :temperature, :temperature=

  attr_reader :sandwich
  def initialize(sandwich)
    @sandwich = sandwich
  end
end
