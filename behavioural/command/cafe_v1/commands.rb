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
  end
end

# Abstract Command
class CoffeeCommand
  attr_reader :machine

  def initialize(machine)
    @machine = machine
  end

  def execute
    raise NotImplementedError
  end
end

# Concrete Command
class EspressoCommand < CoffeeCommand
  def execute
    @machine.grind('espresso')
    @machine.drip
  end
end

# Concrete Command
class CappuccinoCommand < CoffeeCommand
  def execute
    @machine.grind('espresso')
    @machine.drip
    @machine.froth_milk
  end
end
