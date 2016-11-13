require_relative './commands'

# all_tolerant_customer
all_tolerant_customer = Customer.new('Alex')
machine = Machine.new
espresso_command = EspressoCommand.new(machine, all_tolerant_customer)
barista = Barista.new(espresso_command)
barista.process_order

cappuccino_command = CappuccinoCommand.new(machine, all_tolerant_customer)
barista = Barista.new(cappuccino_command)
barista.process_order

# caffeine_intolerant_customer
caffeine_intolerant_customer = Customer.new('Boo', 'caffeine')
espresso_command = EspressoCommand.new(machine, caffeine_intolerant_customer)
barista = Barista.new(espresso_command)
# Will fail intolerance test
# barista.process_order

lactose_intolerant_customer = Customer.new('Foo', 'lactose')
cappuccino_command = CappuccinoCommand.new(machine, lactose_intolerant_customer)
barista = Barista.new(cappuccino_command)
# Will fail intolerance test
# barista.process_order
