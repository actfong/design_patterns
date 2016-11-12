# Receiver
class Customer
  attr_reader :name, :intolerances
  def initialize(name, intolerances=[])
    @name = name
    @intolerances = intolerances
  end
end

# Invoker
class Barista
  attr_accessor :command

  def initialize(command)
    @command = command
  end

  def process_order
    @command.execute
  end
end

# Abstract Command
class CoffeeCommand
  attr_reader :customer

  def initialize(customer)
    @customer = customer
  end

  def valid?
    requirements.none? { |req| customer.intolerances.include?(req) }
  end

  def execute
    raise NotImplementedError
  end

private

  def requirements
    %w(caffeine)
  end
end

# Concrete Command
class DripCoffeeCommand < CoffeeCommand
  def execute
    return nil unless valid?
    ['grind regular beans', 'drip and serve']
  end
end

# Concrete Command
class CappuccinoCommand < CoffeeCommand
  def execute
    return nil unless valid?
    ['grind espresso beans', 'drip espresso', 'froth milk', 'add milk and serve']
  end

  private
  def requirements
    super << 'lactose'
  end
end
