require_relative './commands'

machine = Machine.new
espresso_command = EspressoCommand.new(machine)
barista = Barista.new(espresso_command)
barista.process_order

cappuccino_command = CappuccinoCommand.new(machine)
barista = Barista.new(cappuccino_command)
barista.process_order