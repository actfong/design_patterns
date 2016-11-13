require_relative "./commands"
require 'minitest/autorun'

describe Barista do
  let(:barista) { Barista.new(command_mock) }
  let(:machine) { Machine.new }

  describe '#process_order' do
    let(:command_mock) { Minitest::Mock.new }

    it 'calls #execute on command' do
      command_mock.expect :execute, nil
      barista.process_order
    end
  end
end

describe EspressoCommand do
  let(:customer) { Customer.new('alex') }
  let(:barista) { Barista.new(command) }
  let(:command) { EspressoCommand.new(machine_mock, customer) }
  let(:machine_mock) { Minitest::Mock.new }

  describe 'execute for all-tolerant customer' do
    it 'calls #grind and #drip on machine' do
      machine_mock.expect :grind, nil, ['espresso']
      machine_mock.expect :drip, nil
      command.execute
    end
  end

  describe '#execute for caffeine-INTOLERANT customer' do
    let(:customer) { Customer.new('foobar', ['caffeine']) }
    it 'returns raises IntoleranceError' do
      proc { command.execute }.must_raise IntoleranceError
    end
  end
end

describe CappuccinoCommand do
  let(:customer) { Customer.new('alex') }
  let(:barista) { Barista.new(command) }
  let(:command) { CappuccinoCommand.new(machine_mock, customer) }
  let(:machine_mock) { Minitest::Mock.new }

  describe 'execute for all-tolerant customer' do
    it 'calls #grind and #drip and #froth_milk on machine' do
      machine_mock.expect :grind, nil, ['espresso']
      machine_mock.expect :drip, nil
      machine_mock.expect :froth_milk, nil
      barista.process_order
    end
  end

  describe '#execute for caffeine-INTOLERANT customer' do
    let(:customer) { Customer.new('foobar', ['caffeine']) }
    it 'returns raises IntoleranceError' do
      proc { command.execute }.must_raise IntoleranceError
    end
  end

  describe '#execute for lactose-INTOLERANT customer' do
    let(:customer) { Customer.new('foobar', ['lactose']) }
    it 'returns raises IntoleranceError' do
      proc { command.execute }.must_raise IntoleranceError
    end
  end
end
