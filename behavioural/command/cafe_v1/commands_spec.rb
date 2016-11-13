require_relative "./commands"
require 'minitest/autorun'

describe Barista do
  let(:barista) { Barista.new(command_mock) }
  let(:machine) { Machine.new }

  describe '#process_order' do
    let(:command_mock) { Minitest::Mock.new(machine) }

    it 'calls #execute on command' do
      command_mock.expect :execute, nil
      barista.process_order
    end
  end
end

describe EspressoCommand do
  let(:barista) { Barista.new(command) }
  let(:command) { EspressoCommand.new(machine_mock) }
  let(:machine_mock) { Minitest::Mock.new }

  it 'calls #grind and #drip on machine' do
    machine_mock.expect :grind, nil, ['espresso']
    machine_mock.expect :drip, nil
    barista.process_order
  end
end

describe CappuccinoCommand do
  let(:barista) { Barista.new(command) }
  let(:command) { CappuccinoCommand.new(machine_mock) }
  let(:machine_mock) { Minitest::Mock.new }

  it 'calls #grind and #drip and #froth_milk on machine' do
    machine_mock.expect :grind, nil, ['espresso']
    machine_mock.expect :drip, nil
    machine_mock.expect :froth_milk, nil
    barista.process_order
  end
end
