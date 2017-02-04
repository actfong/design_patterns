require_relative "./strategies"
require 'minitest/autorun'

describe GreetingCard do
  let(:greeting_card) { GreetingCard.new(recipient, sender, strategy_mock)}
  let(:sender) { 'alex' }
  let(:strategy_mock) { Minitest::Mock.new }

  describe '#write with strategy as a block' do
    let(:recipient) { 'Mum and Dad' }
    before do
      strategy_mock.expect :call, ['foo', 'bar'], [sender]
    end
    it 'invokes #call on strategy' do
      greeting_card.write
    end
    it 'contains the expected content' do
      content = greeting_card.write
      content[0].must_equal 'Hi Mum and Dad'
      content[1].must_equal 'foo'
      content[2].must_equal 'bar'
      content[3].must_equal 'Writing address on an envelope'
    end
  end
end
