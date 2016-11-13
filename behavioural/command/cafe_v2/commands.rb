class Customer
  attr_reader :name, :intolerances
  def initialize(name, intolerances=[])
    @name = name
    @intolerances = intolerances
  end
end

# receiver
class Machine
  def grind(beans)
    puts "Grinding #{beans}"
  end

  def drip
    puts "Dripping espresso"
  end

  def froth_milk
    puts 'Frothing milk'
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
    # puts "succesfully processed order for #{command.customer.name}"
  end
end

# Abstract Command
class CoffeeCommand
  attr_reader :machine, :customer

  def initialize(machine, customer)
    @customer = customer
    @machine = machine
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
class EspressoCommand < CoffeeCommand
  def execute
    fail IntoleranceError.new("Customer #{customer.name} fails tolerance test") unless valid?
    @machine.grind('espresso')
    @machine.drip
  end
end

# Concrete Command
class CappuccinoCommand < CoffeeCommand
  def execute
    fail IntoleranceError.new("Customer #{customer.name} fails tolerance test") unless valid?
    @machine.grind('espresso')
    @machine.drip
    @machine.froth_milk
  end

  private
  def requirements
    super << 'lactose'
  end
end

class IntoleranceError < StandardError; end
