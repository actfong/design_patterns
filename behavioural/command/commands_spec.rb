require_relative "./commands"
require 'minitest/autorun'

describe Barista do
  let(:barista) { Barista.new(command_mock) }
  let(:customer) { Customer.new('Alex') }

  describe '#process_order' do
    let(:command_mock) { Minitest::Mock.new(customer) }

    it 'calls #execute on command' do
      command_mock.expect :execute,nil
      barista.process_order
    end
  end
end

describe DripCoffeeCommand do
  let(:command) { DripCoffeeCommand.new(customer) }

  describe '#execute for caffeine-TOLERANT customer' do
    let(:customer) { Customer.new('alex') }
    it 'returns true' do
      command.execute.must_equal(['grind regular beans', 'drip and serve'])
    end
  end

  describe '#execute for caffeine-INTOLERANT customer' do
    let(:customer) { Customer.new('rachael', ['caffeine']) }
    it 'returns false' do
      command.execute.must_equal nil
    end
  end
end

describe CappuccinoCommand do
  let(:command) { CappuccinoCommand.new(customer) }

  describe '#execute for caffeine-INTOLERANT customer' do
    let(:customer) { Customer.new('rachael', ['caffeine']) }
    it 'returns false' do
      command.execute.must_equal nil
    end
  end

  describe '#execute for lactose-INTOLERANT customer' do
    let(:customer) { Customer.new('juliane', ['lactose']) }
    it 'returns false' do
      command.execute.must_equal nil
    end
  end

  describe '#execute for all-TOLERANT customer' do
    let(:customer) { Customer.new('alex') }
    it 'returns false' do
      command.execute.must_equal ['grind espresso beans', 'drip espresso', 'froth milk', 'add milk and serve']
    end
  end
end
